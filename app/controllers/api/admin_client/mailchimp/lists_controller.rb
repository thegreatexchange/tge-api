class Api::AdminClient::Mailchimp::ListsController < ApplicationController

  def index
    service_response = MailchimpService.lists()

    if service_response.has_errors?
      render json: service_response.errors, status: :conflict
    else
      render json: service_response.value, status: :ok
    end
  end
end
