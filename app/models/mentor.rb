class Mentor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :prices
  has_many :subjects, through: :prices
  has_many :personal_messages
  has_many :users, through: :personal_messages
  has_many :appointements
  has_many :availabilities
  has_many :ratings

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate(email, password)
    user = Mentor.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end
