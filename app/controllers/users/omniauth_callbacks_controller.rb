# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # skip_before_action :verify_authenticity_token, only: [:auth0]
  
  def auth0
    binding.pry
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = 'Zalogowano przez Auth0!' if is_navigational_format?
    else
      session['devise.auth0_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url, alert: 'Nie udało się zalogować przez Auth0.'
    end
  end
end
