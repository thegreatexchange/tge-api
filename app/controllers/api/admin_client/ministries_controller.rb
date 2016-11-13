class Api::AdminClient::MinistriesController < ApplicationController

  rapid_actions serializer: ::AdminClient::MinistrySerializer

  permit_params :location_id, :school_id, :name

end
