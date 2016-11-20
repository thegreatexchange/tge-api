class Api::EventClient::SchoolsController < Api::EventClient::BaseController

  rapid_actions serializer: ::EventClient::SchoolSerializer

  permit_params :location_id, :name


end
