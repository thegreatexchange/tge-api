
class Api::AdminClient::Mailchimp::GroupsController < ApplicationController

  def index
    list_id = params[:list_id]
    service_response = MailchimpService.groups(list_id: list_id)

    if service_response.has_errors?
      render json: service_response.errors, status: :conflict
    else
      render json: service_response.value, status: :ok
    end
  end

end
