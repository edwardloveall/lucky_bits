abstract class BrowserAction < Lucky::Action
  include Lucky::ProtectFromForgery
  include Authentic::ActionHelpers(User)
  include Auth::SignInThroughBackdoor
  include Auth::RequireSignIn
  accepted_formats [:html, :json], default: :html
  expose current_user


  private def find_current_user(id) : User
    UserQuery.find(id)
  end
end
