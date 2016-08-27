class Instructor < User
  has_many :courses
  has_many :lessons
  
end
