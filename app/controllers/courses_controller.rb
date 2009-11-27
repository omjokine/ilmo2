class CoursesController < ApplicationController

  def index
    @courses = Course.all
    
    respond_to do |format|
      format.html
      format.pdf { send_data PdfExport.all_courses(@courses) }
    end
  end

  def show
    @course = Course.find(params[:id])
  end

end
