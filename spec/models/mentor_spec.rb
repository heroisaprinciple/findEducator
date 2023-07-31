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
require 'rails_helper'

RSpec.describe Mentor, type: :model do
  let(:mentor) { create(:mentor) }

  describe "associations" do
    it { is_expected.to belong_to(:subject) }
    it { is_expected.to have_many(:conversations).dependent(:destroy) }
    it { is_expected.to have_many(:personal_messages).dependent(:destroy) }
    it { is_expected.to have_many(:appointments).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:appointments) }
    it { is_expected.to have_many(:availabilities).dependent(:destroy) }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe "devise validations" do
    context "emails" do
      it "expects user to be valid" do
        expect(mentor).to be_valid
      end
    end
  end
end
