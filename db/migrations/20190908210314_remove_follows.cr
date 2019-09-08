class RemoveFollows::V20190908210314 < Avram::Migrator::Migration::V1
  def migrate
    drop :follows
  end

  def rollback
    create :follows do
      primary_key id : Int64
      add_timestamps
      add_belongs_to from : User, on_delete: :cascade
      add_belongs_to to : User, on_delete: :cascade
      add accepted_at : Time?
    end
  end
end
