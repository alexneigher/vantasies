require 'rails_helper'

RSpec.describe StripeApi::CustomerService do

  let!(:service){ StripeApi::CustomerService }

  let(:customer_double) {Struct.new(:paid?, :id).new(true, 1)}

  before do
    allow(Stripe::Subscription).to receive(:create)
  end

  describe "perform" do
    let!(:user){ create(:user)}
    let!(:company){ create(:company, user: user) }
    let!(:stripe_token){ '123456UYTREWsdf' }

    it 'pings the stripe api with the right params' do

      expect(Stripe::Customer)
        .to receive(:create)
        .with({ :email => user.email,
                :source => stripe_token,
              }).and_return( customer_double )

      service.new( {company_id: company.id, stripe_token: stripe_token }).perform
    end

    it 'creates a new customer' do
      allow(Stripe::Customer).to receive(:create).and_return( customer_double )
      
      expect(Stripe::Subscription)
        .to receive(:create)
        .with({ :customer => customer_double.id,
                :billing => 'charge_automatically',
                :items => [
                  {
                    :plan => "basic_company_plan",
                  },
                ]
              })

      service.new({company_id: company.id, stripe_token: stripe_token }).perform
    end

    it 'updates the company' do
      allow(Stripe::Customer).to receive(:create).and_return( customer_double )
      service.new( {company_id: company.id, stripe_token: stripe_token }).perform
      expect(company.reload.is_paid).to be true
    end

  end
  
end
