class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.belongs_to :user
      t.belongs_to :exercise_group

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
