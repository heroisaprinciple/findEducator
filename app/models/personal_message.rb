class PersonalMessage < ApplicationRecord
  belongs_to :user
  belongs_to :mentor
  belongs_to :conversation

  validates :content, presence: true
  validates :sent_at, presence: true
end
