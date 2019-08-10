class Users::UpdatePassword < BrowserAction
  include Auth::PasswordResets::FindUser

  post "/users/:user_id/password_update" do
    ResetPassword.update(user, params) do |operation, user|
      if operation.saved?
        flash.success = "Your password has been updated"
        redirect to: Me::Show
      else
        render Me::ShowPage, reset_password: operation
      end
    end
  end
end
