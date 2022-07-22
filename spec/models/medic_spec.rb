require 'rails_helper'

RSpec.describe Medic, type: :model do
  describe "associations" do
    it { should have_many(:schedules) }
    it { should belong_to(:specialty) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:crm) }
  end
end
