FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"阿部"}
    last_name             {"太郎"}
    first_name_kana       {"アベ"}
    last_name_kana        {"タロウ"}
    birthday              {"1997-08-18"}
  end
end