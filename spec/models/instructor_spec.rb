require 'rails_helper'

RSpec.describe Instructor, type: :model do
  it {should have_many :courses}

  describe "abilities" do
    let(:instructor) {FactoryGirl.build_stubbed(:instructor)}
    let(:ability){ Ability.new(instructor) }

    specify {expect(ability).to be_able_to(:manage, City)}
    specify {expect(ability).to be_able_to(:manage, Course)}
    specify {expect(ability).to be_able_to(:manage, Instructor)}
    specify {expect(ability).to be_able_to(:manage, Lesson)}
    specify {expect(ability).to be_able_to(:manage, Offering)}
  end

  describe "seperates active and inactive courses" do
    let(:instructor) {FactoryGirl.build_stubbed(:instructor)}
    let(:wrong_instructor) {FactoryGirl.build_stubbed(:instructor, email: "wrong@instructor.com")}
    let(:ongoing_courses) {FactoryGirl.create_list(:course, 2, :on_going, instructor: instructor)}
    let(:inactive_courses) {FactoryGirl.create_list(:course, 2, :inactive, instructor: instructor)}

    it "#active_courses" do
      expect(instructor.active_courses).to eq(ongoing_courses)
    end

    it "#inactive_courses" do
      expect(instructor.inactive_courses).to eq(inactive_courses)
    end
  end
end
