class CreateGroups::V20190720184549 < Avram::Migrator::Migration::V1
  def migrate
    create :groups do
      primary_key id : Int32
      add_timestamps
      add title : String
    end
  end

  def rollback
    drop :groups
  end
end
