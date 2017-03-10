class AdminClient::OrganizationListModelAdapter < AdminClient::BaseModelAdapter

  def create(params, scope={})
    create_params = params.merge scope
    klass.transaction do
      organizationList = klass.new create_params
      if organizationList.valid?
        if _add_members_to_mailchimp_list_for(organizationList)
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
        if _remove_members_from_mailchimp_list_for(organizationList)
          organizationList.destroy
        else
          #TODO: Handle this more cleanly
          raise "Failure removing organization from mailchimp"
        end
      end
      _query_result_for_member organizationList
    end
  end

  private

  def _add_members_to_mailchimp_list_for(organizationList)
    organization_id = organizationList.organization_id
    list_id         = organizationList.mailchimp_list_id
    person_ids = OrganizationMembership.where(organization_id: organization_id).pluck(:person_id)
    return true if person_ids.empty?

    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    MailchimpService.batch_subscribe!(list_id: list_id, person_ids: person_ids)

    return true
  end

  def _remove_members_from_mailchimp_list_for(organizationList)
    organization_id = organizationList.organization_id
    list_id         = organizationList.mailchimp_list_id
    person_ids = OrganizationMembership.where(organization_id: organization_id).pluck(:person_id)
    return true if person_ids.empty?

    filtered_person_ids = _filter_out_duplicate_people(list_id, organization_id, person_ids)

    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    MailchimpService.batch_unsubscribe!(list_id: list_id, person_ids: filtered_person_ids)

    return true
  end

  #NOTE: Some people may belong to organizations that are part of the same mailchimp list.
  # We don't want to remove those people from the list.
  def _filter_out_duplicate_people(list_id, organization_id, person_ids)
    q = Arel.sql %Q{
      SELECT m.person_id FROM organization_memberships m
      JOIN organization_lists l ON m.organization_id = l.organization_id
      WHERE l.mailchimp_list_id = '#{list_id}' AND l.organization_id != #{organization_id}
      GROUP BY m.person_id
    }
    filtered_out_person_ids = ActiveRecord::Base.connection.execute(q).to_a.map {|r| r['person_id']}
    person_ids - filtered_out_person_ids
  end


end
