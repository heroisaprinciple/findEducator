# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  paid_at    :datetime
#  status     :integer
#  sum        :float
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "enums" do
    it { is_expected.to define_enum_for(:status).with_values(unpaid: 0, paid: 1, canceled: 2) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:appointment) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:sum) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:paid_at) }
  end
end
