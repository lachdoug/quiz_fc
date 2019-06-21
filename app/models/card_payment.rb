class CardPayment

  def initialize( account, params )
    @account = account
    @email = params[:stripeEmail]
    @source = params[:stripeToken]
    @amount = params[:amount].to_i
  end

  def process

    if @amount.to_i < 10

      return {
        alert: "Amount too small. Must be at least $10."
      }

    else

      customer = Stripe::Customer.create(
        :email => @email,
        :source  => @source
      )

      currency = @account.accountable.league.currency

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount.to_i * 100,
        :description => 'QuizFC add money',
        :currency    => currency
      )

      bucks = charge.amount.to_i / 100

      Transactor.new(
        account_id: @account.id,
        amount: bucks,
        params: {
          stripe: {
            charge: charge.id,
            customer: customer.id
          }
        },
        comment: "Add money",
      ).process

      return {
        notice: "You successfully added Q$#{ bucks } to your QuizFC wallet."
      }

    end

  rescue Stripe::CardError => e

    return {
      alert: e.message
    }

  end

end





# charge
# #<Stripe::Charge:0x3fe5804939c8 id=ch_1DzZC0DLDCnaKEhNCVlyRzT4> JSON: {
#   "id": "ch_1DzZC0DLDCnaKEhNCVlyRzT4",
#   "object": "charge",
#   "amount": 1000,
#   "amount_refunded": 0,
#   "application": null,
#   "application_fee": null,
#   "application_fee_amount": null,
#   "balance_transaction": "txn_1DzZC0DLDCnaKEhNByApezc0",
#   "captured": true,
#   "created": 1549155040,
#   "currency": "usd",
#   "customer": "cus_ESUAE0Je2454Fb",
#   "description": "Rails Stripe customer",
#   "destination": null,
#   "dispute": null,
#   "failure_code": null,
#   "failure_message": null,
#   "fraud_details": {},
#   "invoice": null,
#   "livemode": false,
#   "metadata": {},
#   "on_behalf_of": null,
#   "order": null,
#   "outcome": {"network_status":"approved_by_network","reason":null,"risk_level":"normal","risk_score":22,"seller_message":"Payment complete.","type":"authorized"},
#   "paid": true,
#   "payment_intent": null,
#   "receipt_email": null,
#   "receipt_number": null,
#   "receipt_url": "https://pay.stripe.com/receipts/acct_1DzYlGDLDCnaKEhN/ch_1DzZC0DLDCnaKEhNCVlyRzT4/rcpt_ESUABX4TEJavBx74MoKM2osfXn6mveW",
#   "refunded": false,
#   "refunds": {"object":"list","data":[],"has_more":false,"total_count":0,"url":"/v1/charges/ch_1DzZC0DLDCnaKEhNCVlyRzT4/refunds"},
#   "review": null,
#   "shipping": null,
#   "source": {"id":"card_1DzZBvDLDCnaKEhNUhkAbXEn","object":"card","address_city":null,"address_country":null,"address_line1":null,"address_line1_check":null,"address_line2":null,"address_state":null,"address_zip":"2203","address_zip_check":"pass","brand":"Visa","country":"US","customer":"cus_ESUAE0Je2454Fb","cvc_check":"pass","dynamic_last4":null,"exp_month":1,"exp_year":2020,"fingerprint":"d3RhmojlbETuTZZh","funding":"credit","last4":"4242","metadata":{},"name":"lachdoug@gmail.com","tokenization_method":null},
#   "source_transfer": null,
#   "statement_descriptor": null,
#   "status": "succeeded",
#   "transfer_data": null,
#   "transfer_group": null
# }
