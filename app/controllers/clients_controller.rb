class ClientsController < ApplicationController
  skip_before_action :authorize!
  before_action :ensure_trailing_slash

  def admin
    render_client "tge-admin-client"
  end

  def event
    render_client "tge-event-client"
  end

  private

  def render_client(client_name)
    redis    = Redis.new(url: ENV['REDIS_URL'])
    revision = params[:revision] || ENV['CLIENT_REVISION'] || redis.get("#{client_name}:index:current")
    body     = redis.get("#{client_name}:index:#{revision}")

    render body: body, content_type: 'text/html'
  end

  def ensure_trailing_slash
    if request.env['REQUEST_URI'] == "/#{action_name}"
      redirect_to url_for(params.permit(:revision).merge(:trailing_slash => true)), :status => 301
    end
  end

end
