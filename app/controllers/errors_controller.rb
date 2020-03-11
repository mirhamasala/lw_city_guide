class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  def not_found
    render_error(404, "So sorry, it looks like we derailed. Please let us take you home.")
  end

  def unacceptable
    render_error(422, "So sorry, something went wrong. Please try something different or let us take you home.")
  end

  def internal_error
    render_error(500, "So sorry, it looks like we messed up. Please try again or let us take you home.")
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
