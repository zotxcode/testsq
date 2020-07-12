FactoryBot.define do
  factory :patient do
    dob { Faker::Date.between(from: 60.years.ago, to: 1.years.ago) }
    gender { Faker::Gender.binary_type.downcase }
    phone { Faker::PhoneNumber.cell_phone }

    trait :true_patient do
      association :user, :user_for_patient
      name { 'Mark' }
    end

    trait :random do
      association :user, :random_user
      name { Faker::Name.name }
    end
  end

end
