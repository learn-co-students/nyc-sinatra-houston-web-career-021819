class CreateLandmarksTable < ActiveRecord::Migration
  def change
    create_table :landmarks do |table|
      table.string :name
      table.integer :figure_id
      table.integer :year_completed
    end
  end
end
