class Home::Index < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/" do
    if current_user?
      redirect Me::Show
    else
      html Home::IndexPage
    end
  end
end
