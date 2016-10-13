class ClientsController < ApplicationController
  skip_before_action :authorize!

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
    body     = redis.get("#{client_name}:#{revision}")

    render body: body, content_type: 'text/html'
  end
end
