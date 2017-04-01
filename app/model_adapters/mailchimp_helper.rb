class MailchimpHelper

  def self.add_member_to_mailchimp_list_for(organizationMembership)
    organization_id = organizationMembership.organization_id
    person_id       = organizationMembership.person_id
    lists           = OrganizationList.where(organization_id: organization_id)
    return true if lists.empty?

    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    lists.each do |list|
      groupings = format_groupings list.categories
      MailchimpService.subscribe!(list_id: list.mailchimp_list_id, person_id: person_id, groupings: groupings)
    end

    return true
  end

  def self.remove_member_from_mailchimp_list_for(organizationMembership)
    organization_id = organizationMembership.organization_id
    person_id       = organizationMembership.person_id
    list_ids        = OrganizationList.where(organization_id: organization_id).pluck(:mailchimp_list_id)
    return true if list_ids.empty?

    filtered_list_ids = filter_out_duplicate_lists(list_ids, organization_id, person_id)
    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    filtered_list_ids.each do |list_id|
      MailchimpService.unsubscribe!(list_id: list_id, person_id: person_id)
    end

    return true
  end

  #NOTE: Some people may belong to organizations that are part of the same mailchimp list.
  # We don't want to remove someone from lists if they belong to it via another organization.
  def self.filter_out_duplicate_lists(list_ids, organization_id, person_id)
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

  def self.add_members_to_mailchimp_list_for(organizationList)
    organization_id = organizationList.organization_id
    list_id         = organizationList.mailchimp_list_id
    groupings       = format_groupings organizationList.categories
    person_ids = OrganizationMembership.where(organization_id: organization_id).pluck(:person_id)
    return true if person_ids.empty?

    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    MailchimpService.batch_subscribe!(list_id: list_id, person_ids: person_ids, groupings: groupings)

    return true
  end

  def self.remove_members_from_mailchimp_list_for(organizationList)
    organization_id = organizationList.organization_id
    list_id         = organizationList.mailchimp_list_id
    person_ids = OrganizationMembership.where(organization_id: organization_id).pluck(:person_id)
    return true if person_ids.empty?

    filtered_person_ids = filter_out_duplicate_people(list_id, organization_id, person_ids)

    #TODO: Throwing this over the fence and assuming it works. Need more robust handling.
    MailchimpService.batch_unsubscribe!(list_id: list_id, person_ids: filtered_person_ids)

    return true
  end

  #NOTE: Some people may belong to organizations that are part of the same mailchimp list.
  # We don't want to remove those people from the list.
  def self.filter_out_duplicate_people(list_id, organization_id, person_ids)
    q = Arel.sql %Q{
      SELECT m.person_id FROM organization_memberships m
      JOIN organization_lists l ON m.organization_id = l.organization_id
      WHERE l.mailchimp_list_id = '#{list_id}' AND l.organization_id != #{organization_id}
      GROUP BY m.person_id
    }
    filtered_out_person_ids = ActiveRecord::Base.connection.execute(q).to_a.map {|r| r['person_id']}
    person_ids - filtered_out_person_ids
  end

  def self.format_groupings(categories)
    groupings = []
    categories.each do |c|
      groups = c['groups'].select {|g| g['selected'] == true}.map {|g| g['name']}
      groupings << {name: c['name'], groups: groups}
    end
    groupings
  end

end
