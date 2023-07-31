# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  rating     :float
#  review     :string
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :rating do
    user { association :user }
    mentor { association :mentor }
    rating { 1 }
    review { Faker::Lorem.sentence }
  end
end
