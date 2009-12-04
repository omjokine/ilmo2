class AdminController < ApplicationController

  skip_before_filter :is_authenticated?
  before_filter :is_allowed_to_administer?
  
  def show
    
  end

  private
  
  def is_allowed_to_administer?
    redirect_to root_url unless is_admin? # /lib/user_authentication.rb
  end 

end
