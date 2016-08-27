class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  validates :course, presence: true
  validates :student, presence: true
  validates :student_id, uniqueness: { scope: :course_id }
end
