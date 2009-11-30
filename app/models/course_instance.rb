class CourseInstance < ActiveRecord::Base

  belongs_to :course
  has_many :exercise_groups, :dependent => :destroy
  
  
  def registered_users
  #TODO: refactor this
  
    users = []
    
    exercise_groups.each do |exercise_group|
      exercise_group.users.each do |user| 
        users << user
      end
    end
    
    return users
  end
  
end
