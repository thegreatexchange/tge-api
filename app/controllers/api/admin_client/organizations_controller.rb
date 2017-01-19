class Api::AdminClient::OrganizationsController < ApplicationController

  rapid_actions serializer: ::AdminClient::OrganizationSerializer

  permit_params :location_id, :name

end
