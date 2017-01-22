class AdminClient::OrganizationMembershipSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :is_primary

  belongs_to :organization, serializer: AdminClient::OrganizationSerializer
  belongs_to :person,       serializer: AdminClient::PersonSerializer

end

