class CourseInstancesController < ApplicationController

  def index
    @course_instances = CourseInstance.all
  end

  def show
    @course_instance = CourseInstance.find(params[:id])
  end

end
