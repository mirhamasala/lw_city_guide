class ErrorPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def not_found
    @error_status = 404
    @error_message = "So sorry, it looks like we broke this link. Or, you might've accidentally mispelled the url of the page you're trying to see."
    respond_to do |format|
      format.html { render status: 404 }
    end
  end

  def unacceptable
    @error_status = 422
    @error_message = "So sorry, something went wrong. Please try something different."
    respond_to do |format|
      format.html { render status: 422 }
    end
  end

  def internal_error
    @error_status = 500
    @error_message = "So sorry, it looks like we messed up. Please try again."
    respond_to do |format|
      format.html { render status: 500 }
    end
  end
end
