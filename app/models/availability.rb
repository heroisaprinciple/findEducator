class Availability < ApplicationRecord
  belongs_to :mentor

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
