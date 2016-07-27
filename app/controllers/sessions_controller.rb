class SessionsController < ApplicationController

  rapid_sessions_controller

  authenticates_with :email, :password do |params|
    user = User.find_by email: params[:email]

    user.present? && user.password == params[:password] ? user : nil
  end

  responds_with do |authenticated|
    token_payload = {
      user_id: authenticated.id
    }
    {
      token: JWT.encode(token_payload, nil, 'none'),
      id:    authenticated.id,
      email: authenticated.email,
      is_super: authenticated.super
    }
  end

end
