class Schedule < ApplicationRecord
  belongs_to :medic

  validates :medic, :day, :time, presence: true
end
