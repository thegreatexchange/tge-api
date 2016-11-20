class Api::EventClient::BaseController < ApplicationController

  authorize do
    authorization_header = request.headers['Authorization']
    not_authorized! unless authorization_header.present?

    token = authorization_header.split('Bearer ').try :[], 1
    not_authorized! unless token.present?

    decoded_token = decode_jwt_token!(token)
    user_id = decoded_token[0].try :[], 'user_id'
    not_authorized! unless user_id.present?

    user = User.where(id: user_id).first
    not_authorized! unless user.present?

    not_authorized! unless AuthorizationService.authorize(user: user, name: Authorization::VALID_NAMES[:app_event]).value
    user
  end

end
