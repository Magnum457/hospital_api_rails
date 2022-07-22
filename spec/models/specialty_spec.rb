require 'rails_helper'

RSpec.describe Specialty, type: :model do
  describe "associations" do
    it { should have_many(:medics) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
