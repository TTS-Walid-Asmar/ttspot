class Homework < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :student
  validates :student, :lesson, presence: true
  validates :link, url: true
end
