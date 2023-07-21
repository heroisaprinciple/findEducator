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
require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_one(:price).dependent(:destroy) }
    it { is_expected.to have_one(:mentor).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
