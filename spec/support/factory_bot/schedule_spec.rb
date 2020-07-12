FactoryBot.define do
  factory :schedule do
    start_at { ((DateTime.now + 1.day).beginning_of_day + 9.hours) }
    end_at { ((DateTime.now + 1.day).beginning_of_day + 14.hours) }
    max_patient { 10 }
    book_close_in_minute { 30 }

    trait :schedule_for_tomorrow do
      association :doctor, :true_doctor
      association :hospital
    end

    trait :random_schedule do
      association :doctor, :random_doctor
      association :hospital, :random
    end
  end
end
