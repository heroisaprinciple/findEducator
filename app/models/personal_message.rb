class PersonalMessage < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  validates :content, presence: true
  validates :sent_at, presence: true
end
