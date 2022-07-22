require 'rails_helper'

RSpec.describe Specialty, type: :model do
  subject { build(:specialty) }

  context "associations" do
    it { should have_many(:medics) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "Be Valid" do
    it "with all required attributes" do
      expect(build(:specialty)).to be_valid
    end
  end

end
