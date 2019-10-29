app = AppServer.new

spawn do
  app.listen
end

Spec.after_suite do
  LuckyFlow.shutdown
  app.close
end
