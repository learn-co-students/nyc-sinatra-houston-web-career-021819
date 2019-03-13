class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |table|
      table.integer :title_id
      table.integer :figure_id
    end
  end
end
