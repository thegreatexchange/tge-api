class Api::Admin::PeopleController < ApplicationController

  rapid_actions

  permit_params :school_id, :ministry_id, :name, :email, :phone_number

end
