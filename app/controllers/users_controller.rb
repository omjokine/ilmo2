class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    @user.hashed_password = User.crypt_password(@user.password)

    if @user.save
      flash[:notice] = 'Registering ok.'
      redirect_to(root_path) 
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Details was successfully updated.'
      redirect_to(@user)
    else
      render :action => "edit" 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
  end
  
end
