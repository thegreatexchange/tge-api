class Api::AdminClient::PeopleController < ApplicationController

  rapid_actions serializer: ::AdminClient::PersonSerializer

  permit_params :name,
                :email,
                :phone_number

end
