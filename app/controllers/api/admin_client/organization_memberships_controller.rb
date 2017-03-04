class Api::AdminClient::OrganizationMembershipsController < ApplicationController

  rapid_actions serializer:    ::AdminClient::OrganizationMembershipSerializer,
                model_adapter: ::AdminClient::OrganizationMembershipModelAdapter

  permit_params :organization_id, :person_id, :is_primary

  filterable_params :organization_id, :person_id

  def self.adapted_model
    AdminClient::OrganizationMembershipModelAdapter.new(model, { includes: [:organization, :person] })
  end

end
