FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2023-05-25 12:31:29" }
  end
end
