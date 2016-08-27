require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to :instructor }
  it { should belong_to :city }
  it { should belong_to :offering }
  it {should have_many(:registrations).dependent(:destroy)}
  it { should validate_presence_of :instructor }
  it { should validate_presence_of :city }
  it { should validate_presence_of :offering }
  it { should validate_presence_of :starts }
  it { should validate_presence_of :ends }

  let(:course) {FactoryGirl.build_stubbed(:course)}

  it "#address provides a full address" do
    expect(course.address).to eq("HQ Raleigh <br /> 310 South Harrington St. <br /> Raleigh 27601")
  end

  it "#title provides a course title" do
    expect(course.title).to eq("Raleigh Summer 2016 Full Time Code Immersion")
  end
end
