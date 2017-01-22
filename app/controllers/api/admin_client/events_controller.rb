class Api::AdminClient::EventsController < ApplicationController

  #TODO: BDW 01/19/2017 - Add includes once rapid_api is updated to support it.
  rapid_actions model: Event, serializer: ::AdminClient::EventSerializer

  permit_params :organization_id,
                :starts_at,
                :ends_at,
                :description,
                :name

  # TODO: push options down to rAPId
  def self.adapted_model
    AdminClient::BaseModelAdapter.new(model, { includes: :organization })
  end

end
