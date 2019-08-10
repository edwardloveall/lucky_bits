abstract class BaseModel < Avram::Model
  macro default_columns
    primary_key id : Int64
    timestamps
  end

  def self.database
    AppDatabase
  end
end
