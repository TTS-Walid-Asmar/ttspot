class User < ActiveRecord::Base
  # self.inheritance_column = :type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable
         
  has_many :registrations
  has_many :courses, through: :registrations
  validates :name, presence: true

  def active_courses
    courses.where(active: true)
  end
  def inactive_courses
    courses.where(active: false)
  end
end
