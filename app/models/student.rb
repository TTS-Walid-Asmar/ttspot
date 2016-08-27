class Student < User
  has_many :registrations, dependent: :destroy
  has_many :courses, through: :registrations
  has_many :homeworks
end
