database_name = "linkybits_#{LuckyEnv.environment}"

AppDatabase.configure do |settings|
  if LuckyEnv.production?
    settings.credentials = Avram::Credentials.parse(ENV["DATABASE_URL"])
  else
    settings.credentials = Avram::Credentials.parse?(ENV["DATABASE_URL"]?) || Avram::Credentials.new(
      database: database_name,
      hostname: ENV["DB_HOST"]? || "localhost",
      port: ENV["DB_PORT"]?.try(&.to_i) || 5432,
      username: ENV["DB_USERNAME"]? || "postgres",
      password: ENV["DB_PASSWORD"]? || "postgres"
    )
  end
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase
  settings.lazy_load_enabled = LuckyEnv.production?
end
