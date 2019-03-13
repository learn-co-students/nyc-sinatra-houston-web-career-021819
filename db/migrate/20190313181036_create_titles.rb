class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |table|
      table.text :name
    end
  end
end
