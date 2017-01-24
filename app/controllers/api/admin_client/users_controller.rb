class Api::AdminClient::UsersController < ApplicationController

  rapid_actions serializer: ::AdminClient::UserSerializer

  permit_params :name, :email

end
