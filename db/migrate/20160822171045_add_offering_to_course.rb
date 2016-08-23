class AddOfferingToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :offering, index: true, foreign_key: true
  end
end
