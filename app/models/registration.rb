class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :exercise_group

  after_save :add_newsfeed_event

  private

  def add_newsfeed_event
    Newsfeed.create(:message => user.name + " is attending " + exercise_group.course_instance.course.name + ", " + exercise_group.course_instance.name) + "."
  end

end
