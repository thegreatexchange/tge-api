class UsersController < ApplicationController

    rapid_actions

    permit_params :email, :password

end
