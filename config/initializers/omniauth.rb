
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid, 'my-client', '19cca35f-dddd-473a-bdd5-03f00d61d884',
    client_options: {
      site: 'http://localhost:8010',
      realm: 'my-realm',
      base_url: '',
    },
    name: 'keycloak'
end
