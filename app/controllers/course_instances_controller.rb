class CourseInstancesController < ApplicationController

  def index
    @course_instances = CourseInstance.all
  end

  def show
    @course_instance = CourseInstance.find(params[:id])
  end

  def new
    @course_instance = CourseInstance.new
  end

  def edit
    @course_instance = CourseInstance.find(params[:id])
  end

  def create
    @course_instance = CourseInstance.new(params[:course_instance])

    if @course_instance.save
      flash[:notice] = 'CourseInstance was successfully created.'
      redirect_to(@course_instance) 
    else
      render :action => "new" 
    end
  end

  def update
    @course_instance = CourseInstance.find(params[:id])

    if @course_instance.update_attributes(params[:course_instance])
      flash[:notice] = 'CourseInstance was successfully updated.'
      redirect_to(course_course_instance_path(@course_instance.course, @course_instance))
    else
      render :action => "edit" 
    end
  end

  def destroy
    @course_instance = CourseInstance.find(params[:id])
    course = @course_instance.course
    @course_instance.destroy

    redirect_to(course_path(course))
  end
end
