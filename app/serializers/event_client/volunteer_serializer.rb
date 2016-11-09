class EventClient::VolunteerSerializer < ActiveModel::Serializer

  type 'volunteer'

  attributes :id,
             :created_at,
             :updated_at,
             :ministry_id,
             :school_id,
             :name,
             :email,
             :phone_number


end
