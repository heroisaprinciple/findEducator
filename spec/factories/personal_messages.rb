FactoryBot.define do
  factory :personal_message do
    content { "MyText" }
    sent_at { "2023-06-29 14:23:34" }
    user { nil }
    mentor { nil }
    conversation { nil }
  end
end
