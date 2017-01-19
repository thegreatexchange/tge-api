class AdminClient::PersonSerializer < ActiveModel::Serializer

  type 'person'

  attributes :id,
             :created_at,
             :updated_at,
             :name,
             :email,
             :phone_number


end
