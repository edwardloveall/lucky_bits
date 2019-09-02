class AddGroupToBit::V20190902154728 < Avram::Migrator::Migration::V1
  def migrate
    alter :bits do
      add_belongs_to group : Group?, on_delete: :nullify
    end
  end

  def rollback
    alter :bits do
      remove_belongs_to :group
    end
  end
end
