class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

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

  def render_error(status, error_message)
    @status = status
    @error_message = error_message

    respond_to do |format|
      format.html { render status: status }
    end
  end
end
