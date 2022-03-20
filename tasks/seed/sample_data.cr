class Db::Seed::SampleData < LuckyTask::Task
  summary "Add sample database records helpful for development"

  def call
    edward = UserQuery.new.email("edward@edwardloveall.com").first
    elizabeth = SignUpUser.create!(
      Avram::Params.new(
        email: "elizabeth@example.com",
        username: "drliz",
        password: "password",
        password_confirmation: "password",
      )
    )
    fun_pod = SaveGroup.create!(title: "Fun Pod")
    wifey_n_me = SaveGroup.create!(title: "Wifey 'n' Me")
    SaveMembership.create!(user_id: edward.id, group_id: fun_pod.id)
    SaveMembership.create!(user_id: elizabeth.id, group_id: fun_pod.id)
    SaveMembership.create!(user_id: edward.id, group_id: wifey_n_me.id)
    SaveMembership.create!(user_id: elizabeth.id, group_id: wifey_n_me.id)

    SaveBit.create!(
      title: "KNOWER - 3",
      url: "https://www.youtube.com/watch?v=5WwSNBJpB0Y",
      user_id: edward.id,
      group_id: fun_pod.id,
    )
    SaveBit.create!(
      title: "Bad Kitty!",
      url: "https://i.imgur.com/FbuLHsf.gifv",
      user_id: edward.id,
      group_id: wifey_n_me.id,
    )
    SaveBit.create!(
      title: "Pixel Art Castle",
      url: "https://www.deviantart.com/fool/art/iso-castle-75849130",
      description: "This is some good inspiration",
      user_id: elizabeth.id,
      group_id: wifey_n_me.id,
    )
    SaveBit.create!(
      title: "Lobsters",
      url: "https://lobste.rs",
      description: "Here's that link site I was talking about",
      user_id: elizabeth.id,
      group_id: fun_pod.id,
    )

    puts "Done adding sample data"
  end
end
