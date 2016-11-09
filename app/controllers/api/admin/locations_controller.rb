class Api::Admin::LocationsController < ApplicationController

  rapid_actions

  permit_params :region, :country, :state, :city, :zip

end
