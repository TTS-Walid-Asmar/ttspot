class Student < User
  include DeviseInvitable::Inviter
  has_many :registrations, dependent: :destroy
  has_many :courses, through: :registrations
  has_many :homeworks
end
