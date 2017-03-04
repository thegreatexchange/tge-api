class Api::AdminClient::OrganizationListsController < ApplicationController

  rapid_actions serializer: ::AdminClient::OrganizationListSerializer

  permit_params :organization_id, :mailchimp_list_id

  filterable_params :organization_id, :mailchimp_list_id

end
