class Api::Admin::PeopleController < ApplicationController

  rapid_actions

  permit_params :name, :email, :phone_number, :location

end
