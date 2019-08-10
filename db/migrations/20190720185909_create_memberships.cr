class CreateMemberships::V20190720185909 < Avram::Migrator::Migration::V1
  def migrate
    create :memberships do
      primary_key id : Int32
      add_timestamps
      add_belongs_to group : Group, on_delete: :cascade
      add_belongs_to user : User, on_delete: :cascade
    end
  end

  def rollback
    drop :memberships
  end
end
