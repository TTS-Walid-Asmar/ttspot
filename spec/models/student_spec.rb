require 'rails_helper'
require "cancan/matchers"

RSpec.describe Student, type: :model do
  it {should have_many(:registrations).dependent(:destroy)}

  describe "abilities" do
    let(:student) {FactoryGirl.build_stubbed(:student)}
    let(:ability){ Ability.new(student) }

    specify {expect(ability).not_to be_able_to(:manage, City)}
    specify {expect(ability).not_to be_able_to(:manage, Course)}
    specify {expect(ability).not_to be_able_to(:manage, Instructor)}
    specify {expect(ability).not_to be_able_to(:manage, Lesson)}
    specify {expect(ability).not_to be_able_to(:manage, Offering)}
  end

  describe "seperates active and inactive courses" do

    before :context do
      @student = FactoryGirl.build_stubbed(:student)
      @inactive_courses = FactoryGirl.create_list(:course, 2, :inactive)
      @ongoing_courses = FactoryGirl.create_list(:course, 2, :on_going)
      FactoryGirl.create(:registration, student: @student, course: @ongoing_courses[0])
      FactoryGirl.create(:registration, student: @student, course: @ongoing_courses[1])
      FactoryGirl.create(:registration, student: @student, course: @inactive_courses[0])
      FactoryGirl.create(:registration, student: @student, course: @inactive_courses[1])
    end
    it "#active_courses" do
      expect(@student.active_courses).to eq(@ongoing_courses)
    end

    it "#inactive_courses" do
      expect(@student.inactive_courses).to eq(@inactive_courses)
    end
  end
end
