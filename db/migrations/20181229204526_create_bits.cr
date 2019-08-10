class CreateBits::V20181229204526 < Avram::Migrator::Migration::V1
  def migrate
    create :bits do
      primary_key id : Int32
      add_timestamps
      add title : String
      add url : String
      add description : String?
      add_belongs_to user : User, on_delete: :cascade
    end
  end

  def rollback
    drop :bits
  end
end
