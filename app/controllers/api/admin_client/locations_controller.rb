class Api::AdminClient::LocationsController < ApplicationController

  rapid_actions serializer: ::AdminClient::LocationSerializer

  permit_params :region, :country, :state, :city, :zip

end
