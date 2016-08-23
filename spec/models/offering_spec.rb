require 'rails_helper'

RSpec.describe Offering, type: :model do
  it { should validate_presence_of :title }
  it { should have_many :courses }
end
