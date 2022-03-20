# https://github.com/luckyframework/breeze

Breeze.configure do |settings|
  settings.database = AppDatabase
  settings.enabled = LuckyEnv.development?
end
