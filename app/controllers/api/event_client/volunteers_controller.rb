class Api::EventClient::VolunteersController < ApplicationController

  rapid_actions model: People::Volunteer, serializer: ::EventClient::VolunteerSerializer

  permit_params :school_id, :ministry_id, :name, :email, :phone_number

end
