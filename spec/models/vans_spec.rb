require 'rails_helper'

RSpec.describe Van, type: :model do
  
  describe "#needs_to_pay?" do
    let!(:user){ create(:user) }
    let!(:van){ create(:van, user: user, is_paid: false, is_for_sale: true)}

    it 'returns true if is_paid is false and the van is for sale' do
      expect(van.needs_to_pay?).to be true
    end
  end

  describe "#owned_by_company?" do
    let!(:user){ create(:user) }
    let!(:company){ create(:company, user: user) }
    let!(:van){ create(:van, user: user, company_id: company.id, is_paid: false, is_for_sale: true)}

    it "returns true if a company is present" do
      expect(van.owned_by_company?).to be true
    end
  end

  describe '#ready_to_view?' do
    let!(:user){ create(:user) }
    let!(:user_2){ create(:user) }

    context 'when the vans owner is viewing it' do
      let!(:van){ create(:van, user: user)}

      it 'returns true' do
        expect(van.ready_to_view?(user)).to be true
      end
    end

    context 'when the van is for sale and paid' do
      let!(:van){ create(:van, user: user, is_paid: true, is_for_sale: true)}
      it 'returns true' do
        expect(van.ready_to_view?(user_2)).to be true
      end
    end

    context 'when the van is not for sale, just showing off' do
      let!(:van){ create(:van, user: user, is_paid: false, is_for_sale: false)}
      it 'returns true' do
        expect(van.ready_to_view?(user_2)).to be true
      end
    end
  end
  
end
