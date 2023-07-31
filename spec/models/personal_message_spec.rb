# == Schema Information
#
# Table name: personal_messages
#
#  id              :bigint           not null, primary key
#  content         :text
#  sent_at         :datetime
#  user_id         :bigint           not null
#  mentor_id       :bigint           not null
#  conversation_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe PersonalMessage, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:mentor) }
    it { is_expected.to belong_to(:conversation) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:sent_at) }
  end
end
