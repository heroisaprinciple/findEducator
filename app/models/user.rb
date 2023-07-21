# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("user")
#  first_name             :string
#  last_name              :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :secure_validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  enum role: { user: 0, admin: 1 }

  has_many :conversations, dependent: :destroy
  has_many :personal_messages, dependent: :destroy

  has_many :payments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :mentors, through: :appointments

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :first_name, presence: true
  validates :last_name, presence: true

end
