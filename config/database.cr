database_name = "linkybits_#{Lucky::Env.name}"

AppDatabase.configure do |settings|
  if Lucky::Env.production?
    settings.url = ENV.fetch("DATABASE_URL")
  else
    settings.url = ENV["DATABASE_URL"]? || Avram::PostgresURL.build(
      hostname: ENV["DB_HOST"]? || "localhost",
      database: database_name,
    )
  end
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase
  settings.lazy_load_enabled = Lucky::Env.production?
end
