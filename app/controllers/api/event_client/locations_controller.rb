class Api::EventClient::LocationsController < Api::EventClient::BaseController

  rapid_actions serializer: ::EventClient::LocationSerializer

  permit_params :region, :country, :state, :city, :zip

end
