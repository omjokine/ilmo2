class NewsfeedsController < ApplicationController

  def feed
    @stories = (params[:amount] ? Newsfeed.recent(params[:amount]) : Newsfeed.recent)
    
    respond_to do |format|
      format.atom
    end
  end

end
