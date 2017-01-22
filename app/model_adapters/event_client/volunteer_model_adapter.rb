require 'rapid_api/model_adapters'

class EventClient::VolunteerModelAdapter < RapidApi::ModelAdapters::ActiveRecordAdapter

  def create(params, scope=nil)
    scope ||= {}
    klass.transaction do
      event_id = params.delete(:event_id)
      organization_id = params.delete(:organization_id)
      comments = params.delete(:comments)
      create_params = params.merge scope
      member = klass.create create_params
      if organization_id.present? && !member.errors.any?
        organization = Organization.find organization_id

        organization.organization_memberships.create person: member
      end

      if event_id.present? && !member.errors.any?
        event = Event.find event_id

        EventRegistration.create event: event, person: member, comments: comments
      end
      _query_result_for_member member
    end
  end

end
