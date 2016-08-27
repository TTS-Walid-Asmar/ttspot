require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it { should belong_to :instructor }
  it { should belong_to :course }
  it { should validate_presence_of :instructor }
  it { should validate_presence_of :course }
  it { should validate_presence_of :description }
  it { should validate_presence_of :entry }
  it { should validate_presence_of :title }
  it { should validate_presence_of :number }
  it { should validate_presence_of :published }
end
