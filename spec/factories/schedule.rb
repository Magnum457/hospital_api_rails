FactoryBot.define do
    factory :schedule do
        medic { create(:medic) }
        day { Faker::Date.between(from: 2.days.ago, to: Date.today ) }
        time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    end
end