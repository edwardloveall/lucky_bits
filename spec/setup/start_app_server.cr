app = AppServer.new

spawn do
  app.listen
end

at_exit do
  LuckyFlow.shutdown
  app.close
end
