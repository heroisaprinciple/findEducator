class Mentor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :secure_validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_one :subject

  has_many :conversations, dependent: :destroy
  has_many :personal_messages, dependent: :destroy
  has_many :users, through: :conversations

  has_many :appointments, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :first_name, presence: true
  validates :last_name, presence: true

end
