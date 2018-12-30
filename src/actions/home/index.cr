class Home::Index < BrowserAction
  include Auth::SkipRequireSignIn

  get "/" do
    if current_user?
      redirect Me::Show
    else
      render Lucky::WelcomePage
    end
  end
end
