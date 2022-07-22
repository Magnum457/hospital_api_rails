require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "associations" do
    it { should belong_to(:medic) }
  end

  describe "validates" do
    it { should validate_presence_of(:medic) }
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:time) }
  end
end
