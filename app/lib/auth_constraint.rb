class AuthConstraint
  def matches?(request)
    token = request.session[:user_credentials]
    token.present? && User.find_by_persistence_token(token)
  end
end
