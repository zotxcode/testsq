FactoryBot.define do
  # factory :role do
  #
  # end

  factory :user do
    password { '12345678' }
    trait :user_for_doctor do
      email { 'zoe@doctor.xyz' }
      after(:create) {|user| user.add_role(:doctor)}
    end
    trait :user_for_patient do
      email { 'mark@patient.xyz' }
      after(:create) {|user| user.add_role(:patient)}
    end

    trait :random_user do
      email { Faker::Internet.email }
      password { Faker::Lorem.characters(number: 10) }
    end
  end


end