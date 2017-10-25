require 'rails_helper'

RSpec.describe StripeApi::ChargeService do

  let!(:service){ StripeApi::ChargeService }
  let(:charge_double) {Struct.new(:paid?, :id).new(true, 1)}

  describe "perform" do
    let!(:user){ create(:user)}
    let!(:van){ create(:van, user: user) }
    let!(:stripe_token){ '123456UYTREWsdf' }

    it 'pings the stripe api with the right params' do

      expect(Stripe::Charge)
        .to receive(:create)
        .with({ :amount => 2000,
                :currency => "usd",
                :description => "Vantasies Charge",
                :metadata => {"user_id" => user.id, "van_id" => van.id, "user_email" => user.email},
                :source => stripe_token,
              }).and_return( charge_double )

      service.new( {user_id: user.id, van_id: van.id, stripe_token: stripe_token }).perform
    end

    it 'creates a new charge' do
      allow(Stripe::Charge).to receive(:create).and_return( charge_double )
      expect{service.new( {user_id: user.id, van_id: van.id, stripe_token: stripe_token }).perform}
        .to change(Charge, :count).from(0).to(1)
    end

    it 'updates the van' do
      allow(Stripe::Charge).to receive(:create).and_return( charge_double )
      service.new( {user_id: user.id, van_id: van.id, stripe_token: stripe_token }).perform
      expect(van.reload.is_paid).to be true
    end

  end
  
end
