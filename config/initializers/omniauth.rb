Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.credentials.dig(:facebook, :api_key), Rails.application.credentials.dig(:facebook, :api_secret)
end