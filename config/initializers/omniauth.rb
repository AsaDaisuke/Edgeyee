
Rails.application.config.middleware.use OmniAuth::Builder do
  # This API is by Mao's Twitter account
  provider :twitter, "NKJ2m4h7QZUCBhrYZGKp040tW", "GEPUa0DBV01sWAI68ulFSiZ85rZKe0rERtDSeTRY3MxDytRavS"
end
