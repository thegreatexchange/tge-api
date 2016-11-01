class Api::EventClient::LocationsController < ApplicationController

  rapid_actions serializer: ::EventClient::LocationSerializer

  permit_params :region, :country, :state, :city, :zip

end
