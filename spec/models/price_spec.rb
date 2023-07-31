# == Schema Information
#
# Table name: prices
#
#  id         :bigint           not null, primary key
#  amount     :float
#  subject_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Price, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:subject) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:amount) }
  end
end
