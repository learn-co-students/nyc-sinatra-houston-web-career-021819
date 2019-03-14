class CreateFiguretitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do | table |
      table.belongs_to :title
      table.belongs_to :figure
    end
  end
end
