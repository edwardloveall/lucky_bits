LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  {% if flag?(:darwin) %}
    settings.driver_path = "vendor/chromedriver-89-mac64"
  {% elsif flag?(:linux) %}
    settings.driver_path = "vendor/chromedriver-89-linux64"
  {% end %}
  settings.screenshot_directory = "./tmp/screenshots"
end
Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
