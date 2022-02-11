FactoryBot.define do
  factory :schedule do
    start_time  {'2022-02-01 00:07:00'}
    content_id {Faker::Number.between(from: 2, to: 8)}
    assisted   {Faker::Name.initials(number: 2)}

    association :user 
    association :group
  end
end
