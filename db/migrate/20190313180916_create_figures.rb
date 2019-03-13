class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |table|
      table.text :name
    end
  end
end
