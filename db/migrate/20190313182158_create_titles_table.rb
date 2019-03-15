class CreateTitlesTable < ActiveRecord::Migration
  def change
    create_table :titles do |table|
      table.string :name
    end
  end
end
