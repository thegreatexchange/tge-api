class Api::EventClient::MinistriesController < Api::EventClient::BaseController

  rapid_actions serializer: ::EventClient::MinistrySerializer

  permit_params :location_id, :school_id, :name

end
