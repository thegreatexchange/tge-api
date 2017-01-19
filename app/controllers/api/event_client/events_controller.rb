class Api::EventClient::EventsController < Api::EventClient::BaseController

  rapid_actions model: Event.includes(:organization), serializer: ::EventClient::EventSerializer

  permit_params :location_id,
                :organization_id,
                :starts_at,
                :ends_at,
                :description

end
