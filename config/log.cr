# Copied from https://github.com/luckyframework/lucky_cli/blob/5aabbae/src/web_app_skeleton/config/log.cr

require "file_utils"

if Lucky::Env.test?
  FileUtils.mkdir_p("tmp")

  backend = Log::IOBackend.new(File.new("tmp/test.log", mode: "w"))
  backend.formatter = Lucky::PrettyLogFormatter.proc
  Log.dexter.configure(:debug, backend)
elsif Lucky::Env.production?
  backend = Log::IOBackend.new
  backend.formatter = Dexter::JSONLogFormatter.proc
  Log.dexter.configure(:info, backend)
else
  backend = Log::IOBackend.new
  backend.formatter = Lucky::PrettyLogFormatter.proc
  Log.dexter.configure(:debug, backend)
  DB::Log.level = :info
end

Lucky::ContinuedPipeLog.dexter.configure(:none)
Avram::QueryLog.dexter.configure(:none)

Lucky::LogHandler.configure do |settings|
  if Lucky::Env.development?
    settings.skip_if = ->(context : HTTP::Server::Context) {
      context.request.method.downcase == "get" &&
      context.request.resource.starts_with?(/\/css\/|\/js\/|\/assets\/|\/favicon\.ico/)
    }
  end
end
