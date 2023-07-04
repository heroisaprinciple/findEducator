class Subject < ApplicationRecord
  belongs_to :category

  has_one :price, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name
end
