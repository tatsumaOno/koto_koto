FactoryBot.define do
  factory :service do
    title { "MyString" }
    detail { "MyText" }
    price { 500 }
    time   { 1.5 }
    work   { 1 }
    user_id { 7 }
  end
end
