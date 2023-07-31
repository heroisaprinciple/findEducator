# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("user")
#  first_name             :string
#  last_name              :string
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "enums" do
    it { is_expected.to define_enum_for(:role).with_values(user: 0, admin: 1) }
  end

  describe "associations" do
    it { is_expected.to have_many(:conversations).dependent(:destroy) }
    it { is_expected.to have_many(:personal_messages).dependent(:destroy) }
    it { is_expected.to have_many(:payments).dependent(:destroy) }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
    it { is_expected.to have_many(:appointments).dependent(:destroy) }
    it { is_expected.to have_many(:mentors).through(:appointments) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe "devise validations" do
    context "emails" do
      it "expects user to be valid" do
        expect(user).to be_valid
      end
    end
  end
end
