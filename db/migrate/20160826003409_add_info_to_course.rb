class AddInfoToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :start_time, :time
    add_column :courses, :end_time, :time
    add_column :courses, :street_address, :string
    add_column :courses, :zip_code, :integer
    add_column :courses, :office_name, :string
  end
end
