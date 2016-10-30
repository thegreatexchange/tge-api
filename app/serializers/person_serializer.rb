class PersonSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :ministry_id,
             :school_id,
             :name,
             :email,
             :phone_number


end
