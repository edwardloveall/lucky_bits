class SaveBit < Bit::SaveOperation
  permit_columns title
  permit_columns url
  permit_columns description
end
