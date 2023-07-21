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
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'enums' do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, booked: 1, cancelled: 2) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:mentor) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:payment) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:meeting_link) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
  end
end
