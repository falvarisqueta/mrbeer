OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '163361739926-3tq855gipkustgeru06tu1f2kvnfk7pb.apps.googleusercontent.com', 'Eu4-EMMbDWnvysG8IyuK-E4Y', {
    scope: 'email, profile'
  }
end
