class ClientsController < ApplicationController
  skip_before_action :authorize!

  def admin
    redis        = Redis.new(url: ENV['REDIS_URL'])
    revision     = params[:revision] || ENV['CLIENT_REVISION'] || redis.get("tge-admin-client:index:current")

    render body: redis.get("tge-admin-client:index:#{revision}"), content_type: 'text/html'
  end

end
