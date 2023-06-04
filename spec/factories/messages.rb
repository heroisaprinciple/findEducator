FactoryBot.define do
  factory :message do
    content { "MyString" }
    sent_at { "2023-05-31 21:58:45" }
    user { nil }
    mentor { nil }
  end
end
