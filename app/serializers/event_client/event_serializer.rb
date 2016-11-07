class EventClient::EventSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :starts_at,
             :ends_at,
             :description,
             :name

  belongs_to :school,   embed: :id, serializer: EventClient::SchoolSerializer
  belongs_to :ministry, embed: :id, serializer: EventClient::MinistrySerializer

end
