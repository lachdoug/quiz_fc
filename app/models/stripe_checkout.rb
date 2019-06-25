class StripeCheckout

  def call(event)

    event_obj = event.data.object
    account_id = event_obj.client_reference_id
    stripe_checkout_id = event_obj.id
    stripe_customer_id = event_obj.customer
    stripe_payment_id = event_obj.payment_intent

    stripe_payment = Stripe::PaymentIntent.retrieve stripe_payment_id
    stripe_charges = stripe_payment.charges.data

    stripe_charges.each do |charge|

      status = charge.status

      if status == 'succeeded'

        amount = charge.amount
        receipt_url = charge.receipt_url
        bucks = amount / 100

        Transactor.new(
        account_id: account_id,
        amount: bucks,
        params: {
          stripe: {
            charge: charge.id,
            customer: stripe_customer_id,
            checkout: stripe_checkout_id,
            receipt_url: receipt_url
          }
        },
        comment: "Payment received for #{ bucks } Quizbucks.",
        ).process

      end

    end

  end

end
