class EventClient::VolunteerSerializer < ActiveModel::Serializer

  type 'volunteer'

  attributes :id,
             :created_at,
             :updated_at,
             :name,
             :email,
             :phone_number

end
