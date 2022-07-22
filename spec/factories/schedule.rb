FactoryBot.define do
    factory :schedule do
        medic { create(:medic) }
        day { Faker::Date.between(from: 30.days.ago, to: Date.today ) }
        time { I18n.localize(Faker::Time.between(from: Time.now, to: Time.now + 1.hour)) }
    end
end