require "../spec/support/boxes/**"

class Db::CreateRequiredSeeds < LuckyCli::Task
  summary "Add database records required for the app to work"

  def call
    # generate seeds here
    puts "Done adding required data"
  end
end
