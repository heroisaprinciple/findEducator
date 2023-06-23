class Appointement < ApplicationRecord
  belongs_to :mentor
  belongs_to :user

  has_many :payments
  # has_many :users, through: :payments

  enum status: { pending: 0, booked: 1, cancelled: 2 }

  validates :status, presence: true
  validates :meeting_link, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
