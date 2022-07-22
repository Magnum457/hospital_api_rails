class Specialty < ApplicationRecord
    has_many :medics
    validates :name, presence: true
end
