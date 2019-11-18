require "open-uri"
require "json"

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    user = User.find_for_github_oauth(request.env['omniauth.auth'])
    if user == false
      session['devise.github_data'] = request.env['omniauth.auth']
      set_flash_message(:alert, :not_a_wagon_student, kind: 'Github')
      redirect_to new_user_registration_url
    elsif user.persisted?
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
      sign_in_and_redirect user, event: :authentication
      # user.first_login ? redirect_to(edit_user_registration_path) : redirect_to(root_path)
    else
      session['devise.github_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
