class Api::EventClient::EventsController < ApplicationController

  rapid_actions model: Event.includes(:school, :ministry), serializer: ::EventClient::EventSerializer

  permit_params :location_id,
                :school_id,
                :ministry_id,
                :starts_at,
                :ends_at,
                :description

end
