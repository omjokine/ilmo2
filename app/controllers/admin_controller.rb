class AdminController < ApplicationController

  skip_before_filter :is_authenticated?
  
  
  def show
    
  end
  
end
