FactoryBot.define do
    factory :schedule do
        medic { create(:medic) }
        day { Faker::Date.between(from: Date.today, to: 10.days.from_now ) }
        time { I18n.localize(Faker::Time.between(from: Time.now, to: Time.now + 1.hour)) }
    end
end