require "../spec/support/boxes/**"

class Db::CreateRequiredSeeds < LuckyCli::Task
  summary "Add database records required for the app to work"

  def call
    edward = SignUpUser.create!(
      Avram::Params.new(
        email: "edward@edwardloveall.com",
        username: "edwardloveall",
        password: "change me",
        password_confirmation: "change me",
      )
    )

    puts "Done adding required data"
  end
end
