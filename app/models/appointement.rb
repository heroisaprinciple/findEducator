class Appointement < ApplicationRecord
  belongs_to :mentor

  has_many :payments
  has_many :users, through: :payments

  enum status: { booked: 1, cancelled: 2 }

  validates :status, presence: true
  validates :meeting_link, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
