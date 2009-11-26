class CourseInstance < ActiveRecord::Base

  belongs_to :course
  has_many :exercise_groups, :dependent => :destroy
  
end
