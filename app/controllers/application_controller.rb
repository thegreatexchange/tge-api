class ApplicationController < ActionController::API

  rapid_base_controller

  authorize do
    user = nil

    authorization_header = request.headers['Authorization']
    if authorization_header.present?
      token = authorization_header.split(' ')[1]
      decoded_token = decode_jwt_token!(token)
      user_id = decoded_token[0].try :[], 'user_id'
      if user_id.present?
        user = User.find user_id
      end
    end

    user
  end

  def render_error_message(message, status, e)
    raise e
  end

end
