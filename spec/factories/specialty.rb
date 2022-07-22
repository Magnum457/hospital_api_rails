FactoryBot.define do
    factory :specialty do
        name { Faker::Job.field }
    end
end