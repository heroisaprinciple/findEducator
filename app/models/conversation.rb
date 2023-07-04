class Conversation < ApplicationRecord
  belongs_to :mentor
  belongs_to :user

  has_many :personal_messages, dependent: :destroy
  validates_uniqueness_of :user_id, scope: :mentor_id

  scope :between, -> (user_id, mentor_id) do
    where("(conversations.user_id = ? AND conversations.mentor_id = ?) OR
                                  (conversations.user_id = ? AND conversations.mentor_id = ?)",
          user_id, mentor_id, mentor_id, user_id)
  end
end
