class Api::EventClient::BaseController < ApplicationController

  authorize do
    user = authorized_user(request)
    not_authorized! unless AuthorizationService.authorize(user: user, name: Authorization::VALID_NAMES[:app_event]).value
    user
  end

end
