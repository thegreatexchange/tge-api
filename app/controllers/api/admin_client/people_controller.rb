class Api::AdminClient::PeopleController < ApplicationController

  rapid_actions serializer: ::AdminClient::PersonSerializer

  permit_params :school_id, :ministry_id, :name, :email, :phone_number

end
