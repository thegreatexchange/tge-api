class Api::Admin::LocationsController < ApplicationController

  rapid_actions

  permit_params :location_id, :name

end
