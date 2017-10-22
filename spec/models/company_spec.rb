require 'rails_helper'

RSpec.describe Company, type: :model do
  
  context "validations" do

    describe "user_id uniqueness" do
      let!(:user){ create(:user) }
      let!(:company_1){ create(:company, user_id: user.id) }
      let!(:company_2){ build_stubbed(:company, user_id: user.id) }

      it 'forces a uniqueness constraint on user_id' do
        expect(company_1).to be_valid
        expect(company_2).to_not be_valid
      end
    end
  end
  
end
