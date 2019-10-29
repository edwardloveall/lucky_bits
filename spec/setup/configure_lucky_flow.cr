LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  settings.chromedriver_path = "vendor/chromedriver-78-0-3904-70-mac64"
end
Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
