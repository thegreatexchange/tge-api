class Api::AdminClient::EventsController < ApplicationController

  rapid_actions model: Event.includes(:school, :ministry), serializer: ::AdminClient::EventSerializer

  permit_params :location_id,
                :school_id,
                :ministry_id,
                :starts_at,
                :ends_at,
                :description

end
