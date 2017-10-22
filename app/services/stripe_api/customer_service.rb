module StripeApi
  class CustomerService
    class ChargeFailedError < StandardError; end

    BASIC_PLAN_ID = 'basic_company_plan'

    attr_accessor :company, :user, :errors

    def initialize(params)
      @company = Company.find(params[:company_id])
      @user = @company.user
      @token = params[:stripe_token]
      @errors = []
    end

    def perform
      return false unless @company && @token
      begin
        customer = Stripe::Customer.create(
                    :email => @user.email,
                    :source => @token,
                  )

      rescue => e
        @errors << e.to_s
        return false
      end
      subscribe_customer(customer)
    end

    private
      def subscribe_customer(customer)
        subscription = Stripe::Subscription.create(
                        :customer => customer.id,
                        :billing => 'charge_automatically',
                        :items => [
                          {
                            :plan => "basic_company_plan",
                          },
                        ]
                      )

        @company.update(is_paid: true)
      end
  end
end