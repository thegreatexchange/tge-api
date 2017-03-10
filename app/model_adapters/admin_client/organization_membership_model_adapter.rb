class AdminClient::OrganizationMembershipModelAdapter < AdminClient::BaseModelAdapter

  def create(params, scope={})
    create_params = params.merge scope
    klass.transaction do
      organizationMembership = klass.new create_params
      if organizationMembership.valid?
        if _add_member_to_mailchimp_list_for(organizationMembership)
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
        if _remove_member_from_mailchimp_list_for(organizationMembership)
          organizationMembership.destroy
        else
          #TODO: Handle this more cleanly
          raise "Failure removing member from mailchimp"
        end
      end
      _query_result_for_member organizationMembership
    end
  end

  private

  def _add_member_to_mailchimp_list_for(organizationMembership)
    organization_id = organizationMembership.organization_id
    person_id       = organizationMembership.person_id
    list_ids        = OrganizationList.where(organization_id: organization_id).pluck(:mailchimp_list_id)
    return true if list_ids.empty?

    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    list_ids.each do |list_id|
      MailchimpService.subscribe!(list_id: list_id, person_id: person_id)
    end

    return true
  end

  def _remove_member_from_mailchimp_list_for(organizationMembership)
    organization_id = organizationMembership.organization_id
    person_id       = organizationMembership.person_id
    list_ids        = OrganizationList.where(organization_id: organization_id).pluck(:mailchimp_list_id)
    return true if list_ids.empty?

    filtered_list_ids = _filter_out_duplicate_lists(list_ids, organization_id, person_id)
    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    filtered_list_ids.each do |list_id|
      MailchimpService.unsubscribe!(list_id: list_id, person_id: person_id)
    end

    return true
  end

  #NOTE: Some people may belong to organizations that are part of the same mailchimp list.
  # We don't want to remove someone from lists if they belong to it via another organization.
  def _filter_out_duplicate_lists(list_ids, organization_id, person_id)
    q = Arel.sql %Q{
      SELECT l.mailchimp_list_id FROM organization_memberships m
      JOIN organization_lists l ON m.organization_id = l.organization_id
      WHERE l.organization_id != #{organization_id}
      AND m.person_id = #{person_id}
      GROUP BY l.mailchimp_list_id
    }
    filtered_out_list_ids = ActiveRecord::Base.connection.execute(q).to_a.map {|r| r['mailchimp_list_id']}
    list_ids - filtered_out_list_ids
  end


end
