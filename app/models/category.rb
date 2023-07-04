class Category < ApplicationRecord
  has_many :subjects, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name
end
