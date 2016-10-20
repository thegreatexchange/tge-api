class SchoolSerizializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :location_id,
             :name

end
