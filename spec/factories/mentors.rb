# == Schema Information
#
# Table name: mentors
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  occupation             :string
#  subject_id             :bigint           not null
#
FactoryBot.define do
  factory :mentor do
    subject { association :subject }

    email { Faker::Internet.email }
    password { 'passWoRD15#' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    occupation { Faker::Job.title }
  end
end
