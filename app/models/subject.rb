# == Schema Information
#
# Table name: subjects
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
class Subject < ApplicationRecord
  belongs_to :category

  has_one :mentor, dependent: :destroy
  has_one :price, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name
end
