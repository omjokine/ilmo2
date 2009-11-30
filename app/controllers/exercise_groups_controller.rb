class ExerciseGroupsController < ApplicationController

  def index
    @exercise_groups = ExerciseGroup.all
  end

  def show
    @exercise_group = ExerciseGroup.find(params[:id])
  end
  
  def registration
    exercise_group = ExerciseGroup.find(params[:exercise_group_id])
    course_instance = CourseInstance.find(params[:course_instance_id])

    if exercise_group.users.include?(current_user)
      flash[:notice] = 'You have already registered to this exercise group.'
    elsif !course_instance.multiple_registrations? && course_instance.registered_users.include?(current_user)
      flash[:notice] = 'You have already registered to this course instance.'
    else
      exercise_group.users << current_user
 
      flash[:notice] = 'Succesfully registered to the exercise group.' 
    end

    redirect_to course_course_instance_exercise_group_path(course_instance.course, course_instance, exercise_group)
  end

end
