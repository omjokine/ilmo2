class Course < ActiveRecord::Base

  has_many :course_instances, :dependent => :destroy
  
  default_scope :order => "created_at DESC"
  
  named_scope :with_description, :conditions => "description IS NOT NULL"
 
  # Course.recent(4.days.ago)
  # Course.recent() <- 5.months.ago as default
  #
  # *parameters is array of parameters given
  named_scope :recent, lambda { |*parameters|
      later_than = (parameters.size == 1 ? parameters[0] : 5.months.ago )
      
      {:conditions => ["created_at > ? ", later_than]} 
    }
  
end
