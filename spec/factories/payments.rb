# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  paid_at    :datetime
#  status     :integer
#  sum        :float
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :payment do
    user { association :user }
    mentor { association :mentor }

    paid_at { DateTime.current }
    status { 1 }
    sum { 1.5 }
  end
end
