# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :conversation do
  end
end
