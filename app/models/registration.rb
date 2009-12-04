class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :exercise_group

  after_create :add_newsfeed_event

  protected

  def validate
    if exercise_group.users.include?(current_user)
      errors.add(:user, 'You have already registered to this exercise group')
    elsif !exercise_group.course_instance.multiple_registrations? && exercise_group.course_instance.registered_users.include?(current_user)
      errors.add(:user, 'You have already registered to this course instance.')
    end
  end

  private

  def add_newsfeed_event
    Newsfeed.registration_created(exercise_group, user)
  end

end
