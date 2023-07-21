# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  mentor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user) { create(:user) }
  let(:mentor) { create(:mentor) }
  let(:conversation) { create(:conversation, user: user, mentor: mentor) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:mentor) }
    it { is_expected.to have_many(:personal_messages).dependent(:destroy) }
  end

  describe "validations" do
    it "checks for scope" do
      expect { validate_uniqueness_of(:user_id).scoped_to(:mentor_id) }
    end
  end

  describe '.between scope' do
    it 'returns conversations between a user and a mentor' do
      result = Conversation.between(user, mentor)
      expect(result).to include(conversation)
    end
  end
end
