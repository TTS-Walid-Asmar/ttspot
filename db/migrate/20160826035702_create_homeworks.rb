class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.text :link
      t.integer :student_id
      t.references :lesson, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
