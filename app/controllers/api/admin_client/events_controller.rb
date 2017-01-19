class Api::AdminClient::EventsController < ApplicationController

  rapid_actions model: Event.includes(:organization), serializer: ::AdminClient::EventSerializer

  permit_params :location_id,
                :organization_id,
                :starts_at,
                :ends_at,
                :description

end
