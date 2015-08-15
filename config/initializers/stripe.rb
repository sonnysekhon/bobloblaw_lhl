Rails.configuration.stripe = {
  :publishable_key => ENV['pk_live_5EV3PJ1mqC2QbwcRKcnHO04j'],
  :secret_key      => ENV['sk_live_6QPI2iEyHIP606MldSXCMQrD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]