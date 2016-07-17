class ApplicationController < ActionController::API

  rapid_base_controller

  authenticate do |controller|
    authorization_header = controller.request.headers['Authorization']
    if authorization_header.present?
      token = authorization_header.split(' ')[1]
      decoded_token = controller.decode_jwt_token!(token)
      user_id = decoded_token[0].try :[], 'user_id'
      if user_id.present?
        User.find user_id
      else
        nil
      end
    else
      nil
    end
  end

  def render_error_message(message, status, e)
    raise e
  end

end
