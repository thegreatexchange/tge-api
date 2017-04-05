class AdminClient::OrganizationMembershipModelAdapter < AdminClient::BaseModelAdapter

  def create(params, scope={})
    create_params = params.merge scope
    klass.transaction do
      organizationMembership = klass.new create_params
      if organizationMembership.valid?
        if MailchimpHelper.add_member_to_mailchimp_list_for(organizationMembership)
          organizationMembership.save
        else
          #TODO: Handle this more cleanly
          raise "Failure adding member to mailchimp"
        end
      end
      _query_result_for_member organizationMembership
    end
  end

  def destroy(id, scope={})
    organizationMembership = _find_member_with_scope(id, scope)
    klass.transaction do
      if organizationMembership.present?
        if MailchimpHelper.remove_member_from_mailchimp_list_for(organizationMembership)
          organizationMembership.destroy
        else
          #TODO: Handle this more cleanly
          raise "Failure removing member from mailchimp"
        end
      end
      _query_result_for_member organizationMembership
    end
  end

end
