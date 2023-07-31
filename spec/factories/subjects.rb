# == Schema Information
#
# Table name: subjects
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
FactoryBot.define do
  factory :subject do
    category { association :category }

    name { "Anatomy" }
  end
end
