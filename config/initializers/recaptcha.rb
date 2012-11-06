Recaptcha.configure do |config|
  if Rails.env.development?
    config.public_key  = '6LeR4c0SAAAAAHWD6s8eP1BJdSA15xd_p6uHNf2F'
    config.private_key = '6LeR4c0SAAAAAOLdNWuFaMN9gDqAqgztMFnm2uIl'
  end
end