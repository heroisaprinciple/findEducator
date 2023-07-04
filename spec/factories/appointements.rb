FactoryBot.define do
  factory :appointment do
    start_time { "2023-05-31 21:43:23" }
    end_time { "2023-05-31 21:43:23" }
    meeting_link { "MyString" }
    status { 1 }
    description { "MyString" }
    mentor { nil }
    user { nil }
    payment { nil }
  end
end
