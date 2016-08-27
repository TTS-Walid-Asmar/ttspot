class Lesson < ActiveRecord::Base
  belongs_to :course
  belongs_to :instructor
  validates :course, :instructor, :title, :number, :description, :entry, :public, presence: true
  has_many :homeworks
end
