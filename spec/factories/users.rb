FactoryBot.define do
  factory :user do
    id { 10 }
    name { "test10" }
    nickname { "test10nick" }
    email { "test10@gmail.com" }
    password_digest { User.digest('password') }
    activated { "1" }
    activated_at { Time.zone.now }
  end
end