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
require 'rails_helper'

RSpec.describe Availability, type: :model do
  let!(:av) { create(:availability) }
  describe "enums" do
    it { is_expected.to define_enum_for(:status).with_values(free: 0, booked: 1) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:mentor) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:month) }
    it { is_expected.to validate_presence_of(:day) }
  end
end
