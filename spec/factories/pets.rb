FactoryBot.define do
  factory :pet do
    name { "MyString" }
    birth_date { "2024-11-02" }
    user { nil }
  end
end
