class Course < ActiveRecord::Base

  validates :season, :city, :offering, :starts, :instructor, :ends, :street_address, :zip_code, :start_time, :end_time, :office_name, presence: true

  belongs_to :city
  belongs_to :instructor
  belongs_to :offering
  has_many :registrations, dependent: :destroy
  has_many :students, through: :registrations
  has_many :lessons

  def title
    "#{city.name} #{season} #{starts.strftime('%Y')} #{offering.title}"
  end

  def address
    "#{office_name} <br /> #{street_address} <br /> #{city.name} #{zip_code}"
  end

  # def update_to_inactive
  #   if Date.today > ends
  #     update(active: false)
  #   end
  # end
end
