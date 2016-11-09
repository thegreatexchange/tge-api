require 'rapid_api/model_adapters'

class EventClient::VolunteerModelAdapter < RapidApi::ModelAdapters::ActiveRecordAdapter

  def create(params, scope=nil)
    scope ||= {}
    klass.transaction do
      event_id = params.delete(:event_id)
      comments = params.delete(:comments)
      create_params = params.merge scope
      member = klass.create create_params
      if event_id.present? && !member.errors.any?
        event = Event.find event_id
        #TODO: Handle event not found.
        EventRegistration.create event: event, person: member, comments: comments
      end
      _query_result_for_member member
    end
  end

end
