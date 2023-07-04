class Appointment < ApplicationRecord
  enum status: { pending: 0, booked: 1, cancelled: 2 }

  belongs_to :mentor
  belongs_to :user

  has_one :payment

  validates :status, presence: true
  validates :meeting_link, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
