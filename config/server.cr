Lucky::Server.configure do |settings|
  if LuckyEnv.production?
    settings.secret_key_base = secret_key_from_env
    settings.host = "0.0.0.0"
    settings.port = ENV["PORT"].to_i
    settings.gzip_enabled = true
  else
    settings.secret_key_base = "qbh/D7mU9SHX35+daGFwYTNyzpxDxDgu2f0Zf3fhpDI="
    # Change host/port in config/watch.yml
    # Alternatively, you can set the PORT env to set the port
    settings.host = Lucky::ServerSettings.host
    settings.port = Lucky::ServerSettings.port
  end
end

Lucky::ForceSSLHandler.configure do |settings|
  # To force SSL in production, uncomment the line below.
  # This will cause http requests to be redirected to https:
  #
  #    settings.enabled = LuckyEnv.production?
  #
  # Or, leave it disabled:
  settings.enabled = false
end

Lucky::RequestIdHandler.configure do |settings|
  settings.set_request_id = ->(context : HTTP::Server::Context) {
    UUID.random.to_s
  }
end

private def secret_key_from_env
  ENV["SECRET_KEY_BASE"]? || raise_missing_secret_key_in_production
end

private def raise_missing_secret_key_in_production
  raise "Please set the SECRET_KEY_BASE environment variable. You can generate a secret key with 'lucky gen.secret_key'"
end
