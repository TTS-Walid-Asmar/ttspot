class AddSeasonToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :season, :string
  end
end
