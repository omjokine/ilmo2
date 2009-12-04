class CourseInstance < ActiveRecord::Base

  belongs_to :course
  has_many :exercise_groups, :dependent => :destroy
  
  
  def registered_users
    exercise_groups.map{|g| g.users}.flatten.uniq
  end
  
  def allow_multiple_registrations?
    max_exercise_groups && max_exercise_groups > 1
  end
  
end
