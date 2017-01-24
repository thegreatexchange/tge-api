class Api::EventClient::EventsController < Api::EventClient::BaseController

  #TODO: BDW 01/19/2017 - Add includes once rapid_api is updated to support it.
  rapid_actions model: Event, serializer: ::EventClient::EventSerializer

  permit_params :location_id,
                :organization_id,
                :starts_at,
                :ends_at,
                :description

end
