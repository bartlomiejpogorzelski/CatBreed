# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :auth0,
#            ENV['AUTH0_CLIENT_ID'],
#            ENV['AUTH0_CLIENT_SECRET'],
#            ENV['AUTH0_DOMAIN'],
#            callback_path: "/users/auth/auth0/callback",
#            setup: lambda { |env|
#              env['omniauth.strategy'].options[:authenticity_token_protection] = false
#            }
# end
