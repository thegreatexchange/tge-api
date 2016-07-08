class ApplicationController < ActionController::API

  # TODO: Push to rapid with config
  def render_error_message(message, status, e)
    super message, status, e
    log_error e
  end

end
