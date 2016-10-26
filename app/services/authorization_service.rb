class AuthorizationService < BaseService

  def add_authorization
    authorization = Authorization.find_by_name params[:name]
    user          = params[:user]

    return add_error(:authorization, 'Does not exist.') unless authorization.present? && authorization.id.present?
    return add_error(:user, 'Does not exist.')          unless user.present? && user.id.present?

    # TODO: Handle validation errors on user authorization creation
    authorization = UserAuthorization.create user_id: user.id, authorization_id: authorization.id
    set_data authorization: authorization
  end

  def authorize
    authorization_name = params[:name]
    user               = params[:user]

    return add_error(:user, 'Does not exist.') unless user.present? && user.id.present?

    authorization = user.user_authorizations.joins(:authorization).where(is_active:true, authorizations: { name: authorization_name }).first
    return_value authorization.present?
  end

end
