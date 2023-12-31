

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def keycloakopenid
    puts! params, '#keycloakopenid'
    puts! request.env["omniauth.auth"], 'request.env["omniauth.auth"]'

    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.keycloakopenid_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    puts! params, '#failure'

    redirect_to root_path
  end

end


