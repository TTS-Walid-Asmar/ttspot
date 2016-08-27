require 'rails_helper'

RSpec.describe Registration, type: :model do
  it { should validate_presence_of :student }
  it { should validate_presence_of :course }

  it "doesn't allow a student to register for the same course twice"  do
    student = FactoryGirl.create(:student)
    course = FactoryGirl.create(:course, :on_going)
    registration = Registration.create(student: student, course: course)
    duplicate_registration = Registration.create(student: student, course: course)
    expect(duplicate_registration).to be_invalid
  end
end
