class Newsfeed < ActiveRecord::Base

  def self.recent(amount=5) 
    Newsfeed.find(:all, {:limit => amount, :order => "created_at DESC"})
  end

end
