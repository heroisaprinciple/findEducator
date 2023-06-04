FactoryBot.define do
  factory :personal_message do
    content { "MyString" }
    sent_at { "2023-05-31 22:06:34" }
    user { nil }
    mentor { nil }
  end
end
