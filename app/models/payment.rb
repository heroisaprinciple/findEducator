class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :appointement

  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  validates :sum, presence: true
  validates :paid_at, presence: true
  validates :status, presence: true
end
