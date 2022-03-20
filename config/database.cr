database_name = "linkybits_#{LuckyEnv.environment}"

AppDatabase.configure do |settings|
  if LuckyEnv.production?
    settings.credentials = Avram::Credentials.parse(ENV["DATABASE_URL"])
  else
    settings.credentials = Avram::Credentials.parse?(ENV["DATABASE_URL"]?) || Avram::Credentials.new(
      hostname: ENV["DB_HOST"]? || "localhost",
      database: database_name,
      port: ENV["DB_PORT"]?.try(&.to_i) || 5432,
    )
  end
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase
  settings.lazy_load_enabled = LuckyEnv.production?
  settings.query_cache_enabled = !LuckyEnv.test?
end
