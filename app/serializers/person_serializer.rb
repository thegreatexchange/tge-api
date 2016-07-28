class PersonSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :name,
             :email,
             :phone_number,
             :location

end
