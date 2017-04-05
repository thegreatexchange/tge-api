class AdminClient::OrganizationListSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :updated_at,
             :mailchimp_list_id,
             :categories

  belongs_to :organization, serializer: AdminClient::OrganizationSerializer

end
