class Api::AdminClient::OrganizationMembershipsController < ApplicationController

  rapid_actions serializer: ::AdminClient::OrganizationMembershipSerializer

  permit_params :organization_id, :person_id, :is_primary

  filterable_params :organization_id, :person_id

  def self.adapted_model
    AdminClient::BaseModelAdapter.new(model, { includes: [:organization, :person] })
  end

end
