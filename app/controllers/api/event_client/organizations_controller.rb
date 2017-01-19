class Api::EventClient::OrganizationsController < Api::EventClient::BaseController

  rapid_actions serializer: ::EventClient::OrganizationSerializer

  permit_params :location_id, :name

end
