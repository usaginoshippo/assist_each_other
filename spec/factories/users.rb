FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'0000000'}
    password_confirmation {password}
  end
end