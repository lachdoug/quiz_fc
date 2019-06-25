Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'] || 'pk_test_BmkpUKa4Z4Dd3spdpq6QyNPY',
  :secret_key      => ENV['STRIPE_SECRET_KEY'] || 'sk_test_6H12Wiku9XFzSk8mupLtcXNW',
  :signing_secret  => ENV['STRIPE_SIGNING_SECRET'] || 'whsec_pBesFs7bXbPaYiOffqkB6MHbmkzZKaAz'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', StripeCheckout.new
end
