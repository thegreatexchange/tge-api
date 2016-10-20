class LocationSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :region,
             :country,
             :state,
             :city,
             :zip

end
