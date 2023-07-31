# == Schema Information
#
# Table name: availabilities
#
#  id         :bigint           not null, primary key
#  mentor_id  :bigint           not null
#  day        :string
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  month      :integer
#  year       :integer
#  status     :integer
#
FactoryBot.define do
  factory :availability do
    mentor { association :mentor }
    day { "Monday" }
    month { 7 }
    year { "2023" }
    start_time { DateTime.current }
    end_time { DateTime.current + 60.minutes }
    status { Availability.statuses[:free] }
  end
end
