class Bits::Create < BrowserAction
  route do
    SaveBit.create(params, user_id: current_user.id) do |operation, bit|
      if bit
        redirect to: Users::Show.with(current_user)
      else
        render Bits::NewPage, save_bit: operation
      end
    end
  end
end
