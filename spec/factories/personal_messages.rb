# == Schema Information
#
# Table name: personal_messages
#
#  id              :bigint           not null, primary key
#  content         :text
#  sent_at         :datetime
#  user_id         :bigint           not null
#  mentor_id       :bigint           not null
#  conversation_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :personal_message do
    user { association :user }
    mentor { association :mentor }
    conversation { association :conversation }
    content { Faker::Lorem.sentence }
    sent_at { DateTime.current }
  end
end
