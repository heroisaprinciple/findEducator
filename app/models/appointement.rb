class Appointement < ApplicationRecord
  belongs_to :mentor

  has_many :payments
  has_many :users, through: :payments
end
