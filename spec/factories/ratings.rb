FactoryBot.define do
  factory :rating do
    rating { 1 }
    review { "MyString" }
    user { nil }
    mentor { nil }
  end
end
