class RequireUsernameOnUser::V20190120142017 < Avram::Migrator::Migration::V1
  def migrate
    make_required :users, :username
  end

  def rollback
    make_optional :users, :username
  end
end
