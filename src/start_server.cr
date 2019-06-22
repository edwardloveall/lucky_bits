require "./app"

if Lucky::Env.development?
  Avram::Migrator::Runner.new.ensure_migrated!
end
Habitat.raise_if_missing_settings!

app_server = AppServer.new
app_server.listen

Signal::INT.trap do
  app_server.close
end