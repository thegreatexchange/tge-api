class AdminClient::MinistrySerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :location_id,
             :school_id,
             :name

end
