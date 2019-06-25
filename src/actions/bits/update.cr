class Bits::Update < BrowserAction
  route do
    bit = BitQuery.find(bit_id)
    BitForm.update(bit, params) do |form, bit|
      if form.saved?
        flash.success = "Bit updated."
        redirect to: Users::Show.with(current_user)
      else
        flash.failure = "The bit couldn't be saved"
        render EditPage, bit_form: form, bit: bit
      end
    end
  end
end
