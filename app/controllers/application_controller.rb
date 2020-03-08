class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  skip_before_action :authenticate_user!, only: :set_theme

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def set_theme
    if cookies[:theme] == 'dark'
      cookies[:theme] = {
        value: 'light'
      }
    else
      cookies[:theme] = {
          value: 'dark'
        }
    end
    redirect_back(fallback_location: root_path)
  end

  # def set_dark_theme
  #   cookies[:theme] = {
  #     value: 'dark'
  #   }
  #   redirect_back(fallback_location: root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] == "pages" || "errors"
  end

  def user_not_authorized
    flash[:alert] = "So sorry, but you're not authorized for this. 💩"
    redirect_to(root_path)
  end
end
