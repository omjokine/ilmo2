class UsersController < ApplicationController

  skip_before_filter :is_authenticated?, :only => [ :index, :new, :create ]
  
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Account created'
      redirect_to(root_path) 
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Details were successfully updated.'
      redirect_to courses_path
    else
      render :action => "edit" 
    end
  end

  def destroy
    # Using current_user ensures that only current_user can be destroyed (instead of finding by parameter)
    user_to_destroy = current_user 
    log_user_out!
    user_to_destroy.destroy
    redirect_to(login_path)
  end
  
end
