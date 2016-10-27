class EventSerializer < ActiveModel::Serializer

  attributes :id,
             :starts_at,
             :ends_at,
             :description

  belongs_to :school,   embed: :id
  belongs_to :ministry, embed: :id

end
