class BitFlow < AuthenticatedBaseFlow
  def visit_bit_index
    visit Bits::Index, as: user
  end

  def goto_new_bit_form
    click "@new-bit-link"
  end

  def submit_new_bit
    fill_form(
      BitForm,
      title: "LinkyBits",
      url: "https://linkybits.net",
      description: "Maybe we could use this to share links?"
    )
    click "@create-bit-form-submit"
  end

  def should_see_bit_on_page
    el("@bit-title", text: "LinkyBits").should be_on_page
  end
end
