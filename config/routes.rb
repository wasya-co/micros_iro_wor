
Rails.application.routes.draw do
  root to: 'application#home'
  get 'home', to: 'application#home2'
  # get 'login', to: 'application#login', as: :new_user_session

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

  mount Ishapi::Engine,      :at => '/api/', as: :ishapi
  mount IronWarbler::Engine, :at => '/iro_wor/'

end
