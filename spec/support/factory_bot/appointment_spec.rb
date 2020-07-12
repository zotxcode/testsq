FactoryBot.define do
  factory :appointment do
    book_at { ((DateTime.now + 1.day).beginning_of_day + 9.hours) }

    trait :appointment_for_tomorrow do
      association :schedule, :schedule_for_tomorrow
      # Schedule.first || association(:schedule, :schedule_for_tomorrow)
      association :patient, :true_patient
    end

    trait :random_appointment do
      association :schedule, :schedule_for_tomorrow
      association :patient, :random
    end

    # trait :random_appointment do
    #   association :schedule, :random_schedule
    #   association :patient, :random
    # end
  end
end
