# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  start_time   :datetime
#  end_time     :datetime
#  meeting_link :string
#  status       :integer
#  description  :string
#  mentor_id    :bigint           not null
#  user_id      :bigint           not null
#  payment_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :appointment do
    mentor { association :mentor }
    user { association :user }
    payment { association :payment }

    start_time { DateTime.current }
    end_time { DateTime.current + 60.minutes }
    meeting_link { "/linkpink" }
    status { 1 }
    description { Faker::Lorem.sentence }
  end
end
