class Api::Admin::PeopleController < ApplicationController

  rapid_actions

  permit_params :location_id, :school_id, :ministry_id, :name, :email, :phone_number

end
