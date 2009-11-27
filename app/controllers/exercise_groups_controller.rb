class ExerciseGroupsController < ApplicationController

  def index
    @exercise_groups = ExerciseGroup.all
  end

  def show
    @exercise_group = ExerciseGroup.find(params[:id])
  end

end
