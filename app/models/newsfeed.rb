class Newsfeed < ActiveRecord::Base

  default_scope :order => 'updated_at desc'

  named_scope :recent, lambda { |*parameters|
        amount = (parameters.size == 1 ? parameters[0] : 5 )

        { :limit => amount }
  }

  def self.user_created(user)
    self.create_newsfeed(user.username + " registered to Ilmo 2.0.")
  end
  
  def self.course_created(course)
    self.create_newsfeed("New course \"" + course.name + "\" is available. Register now!")
  end
  
  def self.registration_created(exercise_group, user) 
    self.create_newsfeed("#{user.name} is attending #{exercise_group.course_instance.course.name}, #{exercise_group.course_instance.name}.")
  end

  private
  
  def self.create_newsfeed(message)
    Newsfeed.create(:message => message)
  end

end
