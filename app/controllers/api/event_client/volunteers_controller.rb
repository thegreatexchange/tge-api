class Api::EventClient::VolunteersController < ApplicationController

  rapid_actions model:         People::Volunteer,
                serializer:    ::EventClient::VolunteerSerializer,
                model_adapter: ::EventClient::VolunteerModelAdapter

  permit_params :school_id,
                :ministry_id,
                :event_id,
                :name,
                :email,
                :phone_number,
                :is_text_enabled,
                :is_email_enabled,
                :comments

end
