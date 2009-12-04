class NewsfeedController < ApplicationController

  skip_before_filter :is_authenticated?, :only => [ :show ]

  def show
    @stories = (params[:amount] ? Newsfeed.recent(params[:amount]) : Newsfeed.recent)
    
    respond_to do |format|
      format.atom
    end
  end

end
