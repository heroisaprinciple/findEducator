# == Schema Information
#
# Table name: availabilities
#
#  id         :bigint           not null, primary key
#  mentor_id  :bigint           not null
#  day        :string
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  month      :integer
#  year       :integer
#  status     :integer
#
class Availability < ApplicationRecord
  enum status: { free: 0, booked: 1 }

  belongs_to :mentor

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
end
