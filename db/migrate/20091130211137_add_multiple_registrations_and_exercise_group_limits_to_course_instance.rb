class AddMultipleRegistrationsAndExerciseGroupLimitsToCourseInstance < ActiveRecord::Migration
  def self.up
    change_table :course_instances do |t|
      t.integer :min_exercise_groups
      t.integer :max_exercise_groups
    end
  end

  def self.down
    change_table :course_instances  do |t|
      t.remove :min_exercise_groups
      t.remove :max_exercise_groups
    end
  end
end
