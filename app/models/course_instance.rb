class CourseInstance < ActiveRecord::Base

  belongs_to :course
  has_many :exercise_groups, :dependent => :destroy
  
  
  def registered_users
    users = []
    
    exercise_groups.each do |exercise_group|
      users << exercise_group.users
    end
    
    return users
  end
  
end
