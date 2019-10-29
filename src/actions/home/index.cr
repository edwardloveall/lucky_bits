class Home::Index < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/" do
    if current_user?
      redirect Me::Show
    else
      render Home::IndexPage
    end
  end
end
