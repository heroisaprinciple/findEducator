class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  pay_customer

  devise :database_authenticatable, :registerable, :secure_validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  enum role: { user: 0, admin: 1 }

  has_many :conversations, dependent: :destroy
  has_many :personal_messages, dependent: :destroy
  has_many :mentors, through: :conversations

  has_many :payments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :first_name, presence: true
  validates :last_name, presence: true

end
