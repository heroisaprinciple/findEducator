# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  rating     :float
#  review     :string
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rating < ApplicationRecord
  belongs_to :mentor
  belongs_to :user

  validates :rating, presence: true
  validates :review, presence: true
end
