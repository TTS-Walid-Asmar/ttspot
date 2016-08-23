class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :description
      t.date :starts
      t.date :ends
      t.boolean :active, null: false
      t.belongs_to :city, index: true, foreign_key: true, null: false
      
      t.timestamps null: false
    end
  end
end
