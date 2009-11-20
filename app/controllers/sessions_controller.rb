class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:username], params[:password])
    
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome Ilmo 2.0 "+user.username+"!"
      redirect_to courses_path
    else
      reset_session
      flash[:notice] = "Login failed, check your username and password."
      redirect_to root_path
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end
  
end
