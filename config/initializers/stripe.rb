Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'] || 'pk_test_BmkpUKa4Z4Dd3spdpq6QyNPY',
  :secret_key      => ENV['SECRET_KEY'] || 'sk_test_6H12Wiku9XFzSk8mupLtcXNW'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
