class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :personal_messages
  has_many :payments
  has_many :appointements, through: :payments
  has_many :mentors, through: :personal_messages

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role: [:user, :admin]

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end
