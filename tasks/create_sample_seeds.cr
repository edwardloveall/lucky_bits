require "../spec/support/boxes/**"

class Db::CreateSampleSeeds < LuckyCli::Task
  summary "Add sample database records helpful for development"

  def call
    edward = SignUpForm.create!(
      Avram::Params.new(
        email: "edward@edwardloveall.com",
        username: "edwardloveall",
        password: "password",
        password_confirmation: "password",
      )
    )
    magic = SignUpForm.create!(
      Avram::Params.new(
        email: "magic@example.com",
        username: "magic",
        password: "password",
        password_confirmation: "password",
      )
    )

    BitForm.create!(
      title: "KNOWER - 3",
      url: "https://www.youtube.com/watch?v=5WwSNBJpB0Y",
      user_id: edward.id,
    )
    BitForm.create!(
      title: "Bad Kitty!",
      url: "https://i.imgur.com/FbuLHsf.gifv",
      user_id: edward.id,
    )
    BitForm.create!(
      title: "Pixel Art Castle",
      url: "https://www.deviantart.com/fool/art/iso-castle-75849130",
      description: "This is some good inspiration",
      user_id: magic.id,
    )
    BitForm.create!(
      title: "Lobsters",
      url: "https://lobste.rs",
      description: "Here's that link site I was talking about",
      user_id: magic.id,
    )

    params = Avram::Params.new(username: magic.username)
    FollowRequestUsernameForm.create!(params, current_user: edward)

    puts "Done adding sample data"
  end
end
