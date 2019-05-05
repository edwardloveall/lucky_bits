class AddUsernameToUser::V20190120112946 < Avram::Migrator::Migration::V1
  def migrate
    alter :users do
      add username : String?, fill_existing_with: :nothing, unique: true
    end
  end

  def rollback
    alter :users do
      remove :username
    end
  end
end
