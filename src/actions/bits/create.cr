class Bits::Create < BrowserAction
  route do
    BitForm.create(params, user_id: current_user.id) do |form, bit|
      if bit
        render Bits::IndexPage, bits: BitQuery.recently_created
      else
        render Bits::NewPage, bit_form: form
      end
    end
  end
end
