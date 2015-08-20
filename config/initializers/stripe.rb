Rails.configuration.stripe = {
  :publishable_key => 'pk_test_hD5PFgoKwJUUZo6g5yWvZbkE',
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]