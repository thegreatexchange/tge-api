class Api::Admin::MinistriesController < ApplicationController

  rapid_actions

  permit_params :location_id, :school_id, :name

end
