class Instructor < User
  has_many :courses
  has_many :lessons
  has_many :invitations, class_name: 'User', as: :invited_by

end
