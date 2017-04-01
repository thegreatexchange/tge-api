require 'rapid_api/model_adapters'

class EventClient::VolunteerModelAdapter < RapidApi::ModelAdapters::ActiveRecordAdapter

  def create(params, scope={})
    event_id = params.delete(:event_id)
    organization_id = params.delete(:organization_id)
    comments = params.delete(:comments)
    create_params = params.merge scope
    member = klass.new create_params

    begin
      klass.transaction do
        begin
          member.save
          if organization_id.present? && !member.errors.any?
            organization = Organization.find organization_id

            organizationMembership = organization.organization_memberships.new person: member
            if organizationMembership.valid?
              if MailchimpHelper.add_member_to_mailchimp_list_for(organizationMembership)
                organizationMembership.save
              else
                raise "Failure adding member to mailchimp"
              end
            end
          end

          if event_id.present? && !member.errors.any?
            event = Event.find event_id

            EventRegistration.create event: event, person: member, comments: comments
          end
        rescue => e
          member.errors.add :error, e.message
          raise ActiveRecord::Rollback
        end
      end
    rescue => e
    end
    _query_result_for_member member
  end

end
