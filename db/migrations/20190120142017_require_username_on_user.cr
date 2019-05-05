class RequireUsernameOnUser::V20190120142017 < Avram::Migrator::Migration::V1
  def migrate
    execute "ALTER TABLE users ALTER COLUMN username SET NOT NULL"
  end

  def rollback
    execute "ALTER TABLE users ALTER COLUMN username DROP NOT NULL"
  end
end
