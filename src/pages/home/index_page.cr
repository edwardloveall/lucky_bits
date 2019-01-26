class Home::IndexPage < GuestLayout
  def content
    h1 "LuckyBits"
    h2 "Share links with your friends"

    section class: "description" do
      para <<-TEXT
        LuckyBits is a place where you can share links to fun and interesting content that you're into right now.
      TEXT
    end

    section class: "enter" do
      link "Sign Up", to: SignUps::New
      text " | "
      link "Sign In", to: SignIns::New
    end
  end
end
