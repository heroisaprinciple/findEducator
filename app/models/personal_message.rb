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
class PersonalMessage < ApplicationRecord
  belongs_to :user
  belongs_to :mentor
  belongs_to :conversation

  validates :content, presence: true
  validates :sent_at, presence: true
end
