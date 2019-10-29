LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  {% if flag?(:darwin) %}
    settings.chromedriver_path = "vendor/chromedriver-78-mac64"
  {% elsif flag?(:linux) %}
    settings.chromedriver_path = "vendor/chromedriver-78-linux64"
  {% end %}
end
Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
