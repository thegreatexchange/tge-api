class EventClient::EventSerializer < ActiveModel::Serializer

  attributes :id,
             :starts_at,
             :ends_at,
             :description,
             :name

  belongs_to :school,   embed: :id, serializer: EventClient::SchoolSerializer
  belongs_to :ministry, embed: :id, serializer: EventClient::MinistrySerializer

  def name
    'foo'
  end
end
