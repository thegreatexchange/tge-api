class MailchimpService < BaseService

  DOUBLE_OPTIN_SUBSCRIBE     = false
  UPDATE_UNIQUE_SUBSCRIPTION = true
  DELETE_ON_UNSUBSCRIBE      = true


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

    subscription = {
      email: person.email,
    }

    merge_vars = {
      'FNAME' => names[0],
      'LNAME' => names[-1]
    }

    query_result = _mailchimp_client.lists.subscribe(
      list_id,
      subscription,
      merge_vars,
      'html', #email_type
      DOUBLE_OPTIN_SUBSCRIBE,  #double_optin
      UPDATE_UNIQUE_SUBSCRIPTION,   #update_existing
      true,   #replace_interests
      false   #send_welcome
    )
    return_value query_result
  end

  def unsubscribe!
    person_id = params[:person_id]
    list_id   = params[:list_id]
    person = Person.find person_id

    subscription = {
      email: person.email,
    }

    query_result = _mailchimp_client.lists.unsubscribe(
      list_id,
      subscription,
      DELETE_ON_UNSUBSCRIBE,  #delete_member
      false, #send_goodbye
      false, #send_notify
    )
    return_value query_result
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
      [list_hash["id"], list_hash["name"]]
    end
  end

end
