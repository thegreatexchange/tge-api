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
    {
      token: jwt_encode({ user_id: authenticated.id }),
      user: {
        id:    authenticated.id,
        email: authenticated.email
      }
    }
  end

end
