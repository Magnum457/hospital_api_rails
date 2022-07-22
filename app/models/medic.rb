class Medic < ApplicationRecord
  belongs_to :specialty
  has_many :schedules

  validates :name, :crm, presence: true
end
