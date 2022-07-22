require 'rails_helper'

RSpec.describe Medic, type: :model do
  context "associations" do
    it { should have_many(:schedules) }
    it { should belong_to(:specialty) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:crm) }
  end

  context "Be Valid" do
    it "with all required attributes" do
      expect(build(:medic)).to be_valid
    end
  end

end
