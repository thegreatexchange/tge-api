class MailchimpService < BaseService

  ########################################
  DOUBLE_OPTIN_SUBSCRIBE     = false
  UPDATE_UNIQUE_SUBSCRIPTION = true
  DELETE_ON_UNSUBSCRIBE      = true
  EMAIL_TYPE                 = 'html'
  ########################################

  def lists
    query_result = _mailchimp_client.lists.list
    if query_result.present? && query_result["data"].length > 0
      lists = _format_lists(query_result["data"])
    end
    return_value lists
  end

  def subscribe!
    person_id = params[:person_id]
    list_id   = params[:list_id]
    person = Person.find person_id
    names = person.name.split(' ')

    subscriber = {
      email: person.email,
    }

    merge_vars = {
      'FNAME' => names[0],
      'LNAME' => names[-1]
    }

    query_result = _mailchimp_client.lists.subscribe(
      list_id,
      subscriber,
      merge_vars,
      EMAIL_TYPE,
      DOUBLE_OPTIN_SUBSCRIBE,
      UPDATE_UNIQUE_SUBSCRIPTION,
      false, #replace_interests
      false #send_welcome
    )
    return_value query_result
  end

  def batch_subscribe!
    person_ids = params[:person_ids] || []
    list_id    = params[:list_id]
    people = Person.where id: person_ids

    subscribers = []

    people.each do |person|
      subscriber = {
        email: person.email,
      }

      names = person.name.split(' ')
      merge_vars = {
        'FNAME' => names[0],
        'LNAME' => names[-1]
      }

      subscribers << {
        'EMAIL'      => subscriber,
        'EMAIL_TYPE' => EMAIL_TYPE,
        'MERGE_VARS' => merge_vars
      }
    end

    if subscribers.any?
      query_result = _mailchimp_client.lists.batch_subscribe(
        list_id,
        subscribers,
        DOUBLE_OPTIN_SUBSCRIBE,
        UPDATE_UNIQUE_SUBSCRIPTION,
        false #replace_interests
      )
      return_value query_result
    end
  end

  def unsubscribe!
    person_id = params[:person_id]
    list_id   = params[:list_id]
    person = Person.find person_id

    subscriber = {
      email: person.email,
    }

    query_result = _mailchimp_client.lists.unsubscribe(
      list_id,
      subscriber,
      DELETE_ON_UNSUBSCRIBE,
      false, #send_goodbye
      false, #send_notify
    )
    return_value query_result
  end

  def batch_unsubscribe!
    person_ids = params[:person_ids] || []
    list_id    = params[:list_id]
    people = Person.where id: person_ids

    subscribers = []

    people.each do |person|
      subscriber = {
        email: person.email,
      }

      subscribers << subscriber
    end

    if subscribers.any?
      query_result = _mailchimp_client.lists.batch_unsubscribe(
        list_id,
        subscribers,
        DELETE_ON_UNSUBSCRIBE,
        false, #send_goodbye
        false, #send_notify
      )
      return_value query_result
    end
  end

  def members
    return_value _mailchimp_client.lists.members(params[:list_id])["data"]
  end

  def client
    return_value _mailchimp_client
  end

  private

  def _api_key
    ENV['MAILCHIMP_API_KEY']
  end

  def _mailchimp_client
    Mailchimp::API.new(_api_key)
  end

  def _format_lists(mc_lists)
    mc_lists.map do |list_hash|
      {
        id:   list_hash["id"],
        name: list_hash["name"]
      }
    end
  end

end
