FactoryBot.define do
  factory :user do
    name {""}
    email {"test@example.com"}
    password {`123456789`}
    password_confirmation {`123456789`}
  end
end
