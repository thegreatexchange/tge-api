class Api::Admin::SchoolsController < ApplicationController

  rapid_actions

  permit_params :location_id, :name

end
