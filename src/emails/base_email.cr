abstract class BaseEmail < Carbon::Email
  macro inherited
    from default_from
  end

  def default_from
    sender = ENV["EMAIL_SENDER"]? || raise_missing_sender_message
    Carbon::Address.new(sender)
  end

  private def raise_missing_sender_message
    raise "If you are sending emails, make sure you set the EMAIL_SENDER environment variable"
  end
end
