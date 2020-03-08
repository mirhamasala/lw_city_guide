class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def set_light_theme
    cookies[:theme] = {
      value: 'light'
    }
    redirect_back(fallback_location: root_path)
  end

  def set_dark_theme
    cookies[:theme] = {
      value: 'dark'
    }
    redirect_back(fallback_location: root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] == "pages" || "errors"
  end

  def user_not_authorized
    flash[:alert] = "So sorry, but you're not authorized for this. 💩"
    redirect_to(root_path)
  end
end
