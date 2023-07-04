class Payment < ApplicationRecord
  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  belongs_to :user
  belongs_to :appointment, optional: true

  validates :sum, presence: true
  validates :paid_at, presence: true
  validates :status, presence: true
end
