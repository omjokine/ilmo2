class CreateNewsfeeds < ActiveRecord::Migration
  def self.up
    create_table :newsfeeds do |t|
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :newsfeeds
  end
end
