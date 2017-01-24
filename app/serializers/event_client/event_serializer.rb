class EventClient::EventSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :starts_at,
             :ends_at,
             :description,
             :name

  belongs_to :organization, embed: :id, serializer: EventClient::OrganizationSerializer
end
