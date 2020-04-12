require "./server"

Lucky::Session.configure do |settings|
  settings.key = "_linkybits_session"
end

Lucky::CookieJar.configure do |settings|
  settings.on_set = ->(cookie : HTTP::Cookie) {
    cookie.secure(Lucky::ForceSSLHandler.settings.enabled)
    cookie.http_only(true)
  }
end
