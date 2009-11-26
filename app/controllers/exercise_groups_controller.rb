class ExerciseGroupsController < ApplicationController

  def index
    @exercise_groups = ExerciseGroup.all
  end

  def show
    @exercise_group = ExerciseGroup.find(params[:id])
  end

  def new
    @_exercise_group = ExerciseGroup.new
  end

  def edit
    @exercise_group = ExerciseGroup.find(params[:id])
  end

  def create
    @exercise_group = ExerciseGroup.new(params[:exercise_group])

    if @exercise_group.save
      flash[:notice] = 'ExerciseGroup was successfully created.'
      redirect_to(@exercise_group) 
    else
      render :action => "new" 
    end
  end

  def update
    @exercise_group = ExerciseGroup.find(params[:id])

     if @exercise_group.update_attributes(params[:exercise_group])
      flash[:notice] = 'ExerciseGroup was successfully updated.'
      redirect_to(course_course_instance_exercise_group_path(@exercise_group.course_instance.course, @exercise_group.course_instance, @exercise_group))
    else
       render :action => "edit" 
    end
  end

  def destroy
    @exercise_group = ExerciseGroup.find(params[:id])
    course_instance = @exercise_group.course_instance
    @exercise_group.destroy

    redirect_to(course_course_instance_path(course_instance.course, course_instance)) 
   end
end
