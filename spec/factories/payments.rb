FactoryBot.define do
  factory :payment do
    paid_at { "2023-05-31 20:58:57" }
    status { 1 }
    sum { 1.5 }
    user { nil }
    mentor { nil }
  end
end
