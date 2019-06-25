class Users::UpdatePassword < BrowserAction
  include Auth::PasswordResets::FindUser

  post "/users/:user_id/password_update" do
    PasswordResetForm.update(user, params) do |form, user|
      if form.saved?
        flash.success = "Your password has been updated"
        redirect to: Me::Show
      else
        render Me::ShowPage, form: form
      end
    end
  end
end
