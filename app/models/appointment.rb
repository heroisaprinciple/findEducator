# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  start_time   :datetime
#  end_time     :datetime
#  meeting_link :string
#  status       :integer
#  description  :string
#  mentor_id    :bigint           not null
#  user_id      :bigint           not null
#  payment_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Appointment < ApplicationRecord
  enum status: { pending: 0, booked: 1, cancelled: 2 }

  belongs_to :mentor
  belongs_to :user
  belongs_to :payment

  validates :status, presence: true
  validates :meeting_link, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
