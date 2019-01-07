class Home::Index < BrowserAction
  include Auth::SkipRequireSignIn

  get "/" do
    if current_user?
      redirect Bits::Index
    else
      render Lucky::WelcomePage
    end
  end
end
