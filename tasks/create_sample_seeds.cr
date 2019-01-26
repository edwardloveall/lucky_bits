require "../spec/support/boxes/**"

class Db::CreateSampleSeeds < LuckyCli::Task
  banner "Add sample database records helpful for development"

  def call
    # generate sample data here
    puts "Done adding sample data"
  end
end
