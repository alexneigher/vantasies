require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "#has_company?" do
    let!(:user){ create(:user) }
    let!(:company){ create(:company, user_id: user.id) }
    it 'returns true if a company is associated' do
      expect(user.has_company?).to be true
    end
  end
  
end
