# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  rating     :float
#  review     :string
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:mentor) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:review) }
  end
end
