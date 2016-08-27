class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.integer :instructor_id
      t.integer :number
      t.text :description
      t.string :title
      t.text :entry

      t.timestamps null: false
    end
  end
end
