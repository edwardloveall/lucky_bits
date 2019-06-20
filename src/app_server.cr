class AppServer < Lucky::BaseAppServer
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
