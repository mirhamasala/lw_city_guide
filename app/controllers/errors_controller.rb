class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  # The instance variables get passed to the view and all the partials
  # If using instance variables in a view is bad, then usign them in a partial is even worse
  # Because lets imagine, that you use this partial somewhere else, take parts of your view and reuse them
  # If you're using one view from two different controllers
  def not_found
    render_error(404, "So sorry, it looks like we broke this link. Or, you might've accidentally mispelled the url of the page you're trying to see.")
  end

  def unacceptable
    render_error(422, "So sorry, something went wrong. Please try something different.")
  end

  def internal_error
    render_error(500, "So sorry, it looks like we messed up. Please try again.")
  end

  private

  def render_error(status, message)
    @error_status = status
    @error_message = message
    respond_to do |format|
      format.html { render status: status }
    end
  end
end
