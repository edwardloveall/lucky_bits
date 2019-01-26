class Home::Index < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/" do
    if current_user?
      redirect Bits::Index
    else
      render Home::IndexPage
    end
  end
end
