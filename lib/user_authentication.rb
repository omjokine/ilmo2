module UserAuthentication

  # This is loaded to helpers and controllers.
  # If authentication method needs to be changed, this is the only place to change it
  
  protected
  
  def log_user_in(user)
    session[:user_id] = user.id if user
  end
  
  def log_user_out!
    session[:user_id] = nil
  end
  
  def current_user
    User.find(session[:user_id])
  end
  
  def logged_in?
    session[:user_id]
  end

end