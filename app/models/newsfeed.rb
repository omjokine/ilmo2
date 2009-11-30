class Newsfeed < ActiveRecord::Base

  def self.recent(amount=5) 
    Newsfeed.find(:all, {:limit => amount, :order => "updated_at DESC"})
  end

end
