ENV["LUCKY_TASK"] = "true"
# Load Lucky and the app (actions, models, etc.)
require "./src/app"
require "lucky_task"

require "./tasks/**"
require "./db/migrations/**"
require "lucky/tasks/**"
require "breeze/tasks"

LuckyTask::Runner.run
