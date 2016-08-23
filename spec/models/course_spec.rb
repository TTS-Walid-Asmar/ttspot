require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to :city }
  it { should belong_to :offering }
  it { should validate_presence_of :active }
  it { should validate_presence_of :city }
  it { should validate_presence_of :offering }
  it { should validate_presence_of :starts }
  it { should validate_presence_of :ends }
end
