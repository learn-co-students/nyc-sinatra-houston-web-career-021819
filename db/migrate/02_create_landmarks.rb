class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do | table |
      table.string :name
      table.belongs_to :figure
      table.integer :year_completed
    end
  end
end
