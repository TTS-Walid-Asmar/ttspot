class Offering < ActiveRecord::Base
  validates :title, presence: true
  has_many :courses

  def active_courses
    courses.where(active: true)
  end
  
  def inactive_courses
    courses.where(active: false)
  end
end
