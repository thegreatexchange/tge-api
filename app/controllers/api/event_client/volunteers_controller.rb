class Api::EventClient::VolunteersController < Api::EventClient::BaseController

  rapid_actions model:         Person,
                serializer:    ::EventClient::VolunteerSerializer,
                model_adapter: ::EventClient::VolunteerModelAdapter

  permit_params :organization_id,
                :event_id,
                :name,
                :email,
                :phone_number,
                :comments

end
