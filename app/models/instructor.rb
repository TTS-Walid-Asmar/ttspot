class Instructor < User
  devise :database_authenticatable, :validatable
  include DeviseInvitable::Inviter
  has_many :courses
  has_many :lessons
  has_many :invitations, class_name: 'User', as: :invited_by

end
