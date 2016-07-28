class PeopleController < ApplicationController

  rapid_actions

  permit_params :name, :email, :phone_number, :location

end
