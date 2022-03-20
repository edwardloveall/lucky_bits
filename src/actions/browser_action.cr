abstract class BrowserAction < Lucky::Action
  include Lucky::EnforceUnderscoredRoute
  include Lucky::ProtectFromForgery
  include Lucky::SecureHeaders::DisableFLoC
  include Authentic::ActionHelpers(User)
  include Auth::SignInThroughBackdoor
  include Auth::RequireSignIn
  accepted_formats [:html, :json], default: :html
  expose current_user

  private def find_current_user(id) : User
    UserQuery.find(id)
  end
end
