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

    is_super = AuthorizationService.authorize(user: authenticated, name: 'super').value

    {
      token: JWT.encode(token_payload, nil, 'none'),
      id:    authenticated.id,
      email: authenticated.email,
      is_super: is_super
    }
  end

end
