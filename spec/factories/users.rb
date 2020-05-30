FactoryBot.define do
  factory :user do
    uid { Faker::Number.unique.number(digits: 10) }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    email { Faker::Internet.unique.email(domain: 'example') }
    state { Faker::Address.state }
  end
end
