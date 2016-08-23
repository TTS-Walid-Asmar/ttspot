class Course < ActiveRecord::Base
  validates :active, :city, :offering, :starts, :ends, presence: true
  belongs_to :city
  belongs_to :offering
end
