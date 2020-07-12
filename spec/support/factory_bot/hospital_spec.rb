FactoryBot.define do
  factory :hospital do
    email { 'typea@hospital.xyz' }
    name { 'Rs. Type A' }
    address { 'Jl. Street' }
    city { 'Jakarta' }
    phone { '123456789' }
    trait :random do
      email { Faker::Internet.email }
      name { Faker::Company.name }
      address { Faker::Address.street_address }
      city { Faker::Address.city }
      phone { Faker::Company.duns_number }
    end
  end
end
