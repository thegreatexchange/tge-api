class Api::Admin::UsersController < ApplicationController

  rapid_actions

  permit_params :name, :email

end
