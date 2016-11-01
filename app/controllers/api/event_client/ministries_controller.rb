class Api::EventClient::MinistriesController < ApplicationController

  rapid_actions serializer: ::EventClient::MinistrySerializer

  permit_params :location_id, :school_id, :name

end
