class AdminClient::OrganizationListModelAdapter < AdminClient::BaseModelAdapter

  def create(params, scope={})
    create_params = params.merge scope
    klass.transaction do
      organizationList = klass.new create_params
      if organizationList.valid?
        if MailchimpHelper.add_members_to_mailchimp_list_for(organizationList)
          organizationList.save
        else
          #TODO: Handle this more cleanly
          raise "Failure adding organization to mailchimp"
        end
      end
      _query_result_for_member organizationList
    end
  end

  def destroy(id, scope={})
    organizationList = _find_member_with_scope(id, scope)
    klass.transaction do
      if organizationList.present?
        if MailchimpHelper.remove_members_from_mailchimp_list_for(organizationList)
          organizationList.destroy
        else
          #TODO: Handle this more cleanly
          raise "Failure removing organization from mailchimp"
        end
      end
      _query_result_for_member organizationList
    end
  end

end
