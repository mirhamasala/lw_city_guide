class ApplicationController < ActionController::Base
  # 1
  # modules and concers like "include Pundit"
  # Rails defines concerns, modules come from Ruby
  include Pundit

  # 2
  # attribute accessors - gives you both read and write access
  # attr_reader :user, :record - gives you access to an instance variable

  # 3
  # class method calls
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # Pundit: white-list approach.
  # Makes sure that you're calling the authorize method at some point
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def skip_pundit?
    devise_controller? || params[:controller] == "pages"
    # devise_controller? || params[:controller] =~ /(^pages$)/
    # devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = @not_authorized_message || "You are not authorized to perform this action."
    # flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:github_handle])
  end
end
