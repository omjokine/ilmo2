class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :exercise_group

  after_create :add_newsfeed_event

  validate :must_be_the_only_registration_for_this_instance
  validate :check_that_registrations_are_not_exceeded

  protected

  def must_be_the_only_registration_for_this_instance
    if exercise_group.users.include?(current_user)
      errors.add(:exercise_group, 'You have already registered to this exercise group')
    end
  end
  
  def check_that_registrations_are_not_exceeded
    if !exercise_group.course_instance.allow_multiple_registrations? && exercise_group.course_instance.registered_users.include?(current_user)
      errors.add(:exercise_group, 'You have already registered to this course instance.')
    end
  end

  private

  def add_newsfeed_event
    Newsfeed.registration_created(exercise_group, user)
  end

end
