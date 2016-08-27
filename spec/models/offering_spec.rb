require 'rails_helper'

RSpec.describe Offering, type: :model do
  it { should validate_presence_of :title }
  it { should have_many :courses }

  describe "#active_courses" do
    let(:offering){FactoryGirl.create(:offering)}
    let(:inactive_course) {FactoryGirl.create_list(:course, 2, active: false, offering: offering)}
    let(:ongoing_courses) {FactoryGirl.create_list(:course, 2, active: true, offering: offering)}

    specify { expect(offering.active_courses).to eq(ongoing_courses)}
    specify { expect(offering.inactive_courses).to eq(inactive_course)}
  end
end
