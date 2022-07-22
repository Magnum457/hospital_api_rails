FactoryBot.define do
    factory :medic do
        name { Faker::Name.first_name }
        crm { Faker::Alphanumeric.alphanumeric(number: 12, min_alpha: 4, min_numeric: 4) }
        email { Faker::Internet.email }
        telephone { Faker::PhoneNumber.cell_phone }
        specialty { create(:specialty) }
    end
end