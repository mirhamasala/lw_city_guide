class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def skip_pundit?
    devise_controller? || params[:controller] == "pages" || "errors"
  end

  def user_not_authorized
    flash[:alert] = "So sorry, but you're not authorized for this. 💩"
    redirect_to(root_path)
  end

  # Redirect back to current page after sign in, sign out, sign up, update
  # It's important that the location is NOT stored if:
  # The request method is not GET (non idempotent)
  # The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
  # infinite redirect loop
  # The request is an Ajax request as this can lead to very unexpected behaviour
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
