class Bits::Create < BrowserAction
  route do
    BitForm.create(params, user_id: current_user.id) do |form, bit|
      if bit
        render Me::ShowPage, bits: BitQuery.new.preload_user.user_id(current_user.id)
      else
        render Bits::NewPage, bit_form: form
      end
    end
  end
end
