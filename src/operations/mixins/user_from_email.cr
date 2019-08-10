module UserFromEmail
  private def user_from_email
    email.value.try do |value|
      UserQuery.new.email(value).first?
    end
  end
end
