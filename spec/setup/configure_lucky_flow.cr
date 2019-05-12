LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  binary = "chromedriver-74-0-3729-6-mac64"
  settings.chromedriver_path = "#{__DIR__}/../../vendor/#{binary}"
end
Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
