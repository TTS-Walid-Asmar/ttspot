require 'rails_helper'

RSpec.describe Homework, type: :model do
  it { should belong_to :student }
  it { should belong_to :lesson }
  it { should validate_presence_of :student }
  it { should validate_presence_of :lesson }

  describe "valid urls" do
    specify {expect(FactoryGirl.build_stubbed(:homework)).to be_valid}
    specify {expect(FactoryGirl.build_stubbed(:homework, link: "github.com")).to be_valid}

    specify {expect(FactoryGirl.build_stubbed(:homework, link: "www.github.com")).to be_valid}  
    specify {expect(FactoryGirl.build_stubbed(:homework, link: "http://www.github.com")).to be_valid}
  end

  describe "invalid urls" do
    specify {expect(FactoryGirl.build_stubbed(:homework, link: "ww.")).to be_invalid}
    specify {expect(FactoryGirl.build_stubbed(:homework, link: "github")).to be_invalid}
    specify {expect(FactoryGirl.build_stubbed(:homework, link: "www.github")).to be_invalid}
    specify {expect(FactoryGirl.build_stubbed(:homework, link: "localhost:3000")).to be_invalid}
  end

end
