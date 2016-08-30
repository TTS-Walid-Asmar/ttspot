class User < ActiveRecord::Base
  # self.inheritance_column = :type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_many :registrations
  accepts_nested_attributes_for :registrations, reject_if: :all_blank, allow_destroy: true
  has_many :courses, through: :registrations
  validates :name, presence: true

  def active_courses
    courses.where(active: true)
  end
  def inactive_courses
    courses.where(active: false)
  end
end
