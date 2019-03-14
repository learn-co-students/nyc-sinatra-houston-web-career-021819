class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do | table |
      table.string :name
    end
  end
end
