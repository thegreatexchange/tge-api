class Api::AdminClient::SchoolsController < ApplicationController

  rapid_actions serializer: ::AdminClient::SchoolSerializer

  permit_params :location_id, :name

end
