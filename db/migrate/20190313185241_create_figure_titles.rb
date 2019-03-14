class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do | table |
      table.belongs_to :figure, index: true
      table.belongs_to :title, index: true
    end
  end
end
