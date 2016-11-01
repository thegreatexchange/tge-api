class Api::EventClient::SchoolsController < ApplicationController

  rapid_actions serializer: ::EventClient::SchoolSerializer

  permit_params :location_id, :name


end
