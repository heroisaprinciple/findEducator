# == Schema Information
#
# Table name: prices
#
#  id         :bigint           not null, primary key
#  amount     :float
#  subject_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :price do
    subject { association :subject }
    amount { 9.99 }
  end
end
