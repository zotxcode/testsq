FactoryBot.define do
  factory :doctor do

    trait :true_doctor do
      association :user, :user_for_doctor
      name { 'Dr. Zoe' }
      specialize { 'Dermatologists, Family Physicians' }

    end

    trait :random_doctor do
      association :user, :random_user
      name { Faker::Name.name }
      specialize { Faker::Lorem.sentence }

    end
  end

end
