class EventClient::VolunteerSerializer < ActiveModel::Serializer

  type 'volunteers'

  attributes :id,
             :created_at,
             :updated_at,
             :name,
             :email,
             :phone_number

end
