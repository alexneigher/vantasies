module StripeApi
  class ChargeService
    CHARGE_AMOUNT = 6900

    attr_accessor :van, :user, :errors

    def initialize(params)
      @user = User.find(params[:user_id])
      @van = Van.find(params[:van_id])
      @token = params[:stripe_token]
      @errors = []
    end

    def perform
      return false unless @user && @van && @token

      begin
        charge = Stripe::Charge.create(
                  :amount => CHARGE_AMOUNT,
                  :currency => "usd",
                  :description => "Vantasies Charge",
                  :metadata => {"user_id" => @user.id, "van_id" => @van.id, "user_email" => @user.email},
                  :source => @token,
                )
      rescue => e
        binding.pry
        @errors << e.to_s
        return false
      end
      persist_charge(charge)
    end

    private
      def persist_charge(charge)
        Charge.create(user: @user, van: @van, stripe_charge_id: charge.id)
        @van.update(is_paid: true)
      end
  end
end