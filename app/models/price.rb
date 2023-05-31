class Price < ApplicationRecord
  belongs_to :mentor
  belongs_to :subject

  validates :amount, presence: true
end
