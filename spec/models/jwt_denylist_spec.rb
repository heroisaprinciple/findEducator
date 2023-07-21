# == Schema Information
#
# Table name: jwt_denylist
#
#  id         :bigint           not null, primary key
#  jti        :string           not null
#  exp        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe JwtDenylist, type: :model do
  describe '.table_name' do
    it 'has the correct table name' do
      expect(described_class.table_name).to eq('jwt_denylist')
    end
  end

  describe 'included modules' do
    it 'includes Devise::JWT::RevocationStrategies::Denylist' do
      expect(described_class.ancestors).to include(Devise::JWT::RevocationStrategies::Denylist)
    end
  end
end
