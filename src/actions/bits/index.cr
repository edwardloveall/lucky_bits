class Bits::Index < BrowserAction
  route do
    bits = BitQuery.new.created_at.desc_order
    render IndexPage, bits: bits
  end
end
