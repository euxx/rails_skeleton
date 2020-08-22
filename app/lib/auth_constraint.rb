class AuthConstraint
  def matches?(request)
    User.find_by_persistence_token(request.session[:user_credentials])
  end
end
