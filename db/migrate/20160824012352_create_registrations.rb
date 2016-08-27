class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :student_id
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
