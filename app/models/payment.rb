# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  paid_at    :datetime
#  status     :integer
#  sum        :float
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Payment < ApplicationRecord
  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  belongs_to :user
  has_one :appointment

  validates :sum, presence: true
  validates :paid_at, presence: true
  validates :status, presence: true
end
