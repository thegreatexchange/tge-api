class SessionsController < ApplicationController

  rapid_sessions_controller

  authenticates_with :email, :password do |params|
    user = User.find_by email: params[:email]

    if user.present? && user.password == params[:password]
      user
    else
      nil
    end
  end

  responds_with do |authenticated|
    token_payload = {
      user_id: authenticated.id
    }
    {
      token: JWT.encode(token_payload, nil, 'none'),
      data: {
        id:    authenticated.id,
        email: authenticated.email
      }
    }
  end

end
