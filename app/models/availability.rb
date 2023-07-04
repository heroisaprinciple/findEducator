class Availability < ApplicationRecord
  enum status: { free: 0, booked: 1 }

  belongs_to :mentor

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
end
