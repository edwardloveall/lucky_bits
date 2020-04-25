class EnforceGroupOnBits::V20200425175611 < Avram::Migrator::Migration::V1
  def migrate
    alter :bits do
      make_required :bits, :group_id
    end
  end

  def rollback
    alter :bits do
      make_optional :bits, :group_id
    end
  end
end
