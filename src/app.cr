require "./dependencies"
Lucky::AssetHelpers.load_manifest
require "./models/base_model"
require "./models/mixins/**"
require "./models/user"
require "./models/**"
require "./queries/mixins/**"
require "./queries/**"
require "./forms/mixins/**"
require "./forms/**"
require "./serializers/**"
require "./emails/base_email"
require "./emails/**"
require "./actions/mixins/**"
require "./actions/**"
require "./components/base_component"
require "./components/**"
require "./pages/**"
require "../config/env"
require "../config/**"
require "../db/migrations/**"

class App < Lucky::BaseApp
  private getter server

  def middleware
    [
      Lucky::HttpMethodOverrideHandler.new,
      Lucky::LogHandler.new,
      Lucky::SessionHandler.new,
      Lucky::FlashHandler.new,
      Lucky::ErrorHandler.new(action: Errors::Show),
      Lucky::RouteHandler.new,
      Lucky::StaticFileHandler.new("./public", false),
      Lucky::RouteNotFoundHandler.new,
    ]
  end
end
