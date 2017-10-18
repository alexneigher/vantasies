module StripeApi
  class ChargeService
    CHARGE_AMOUNT = 9900
    class ChargeFailedError < StandardError; end

    attr_accessor :van, :user
    
    def initialize(params)
      @user = User.find(params[:user_id])
      @van = Van.find(params[:van_id])
      @token = params[:stripe_token]
    end

    def perform
      return false unless @user && @van && @token

      begin
        charge = Stripe::Charge.create(
                  :amount => CHARGE_AMOUNT,
                  :currency => "usd",
                  :description => "Vantasies Charge",
                  :source => @token,
                )
        raise ChargeFailedError unless charge.paid?
        persist_charge(charge)

      rescue ChargeFailedError
        return false
      end
    end


    private
      def persist_charge(charge)
        Charge.create(user: @user, van: @van, stripe_charge_id: charge.id)
        @van.update(is_paid: true)
      end
  end
end