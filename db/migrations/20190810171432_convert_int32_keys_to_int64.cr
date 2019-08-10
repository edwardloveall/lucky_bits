class ConvertInt32KeysToInt64::V20190810171432 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(Bit) do
      change_type id : Int64
      change_type user_id : Int64
    end
    alter table_for(Follow) do
      change_type id : Int64
      change_type from_id : Int64
      change_type to_id : Int64
    end
    alter table_for(Group) do
      change_type id : Int64
    end
    alter table_for(Membership) do
      change_type id : Int64
      change_type group_id : Int64
      change_type user_id : Int64
    end
    alter table_for(User) do
      change_type id : Int64
    end
  end

  def rollback
    alter table_for(Bit) do
      change_type id : Int32
      change_type user_id : Int32
    end
    alter table_for(Follow) do
      change_type id : Int32
      change_type from_id : Int32
      change_type to_id : Int32
    end
    alter table_for(Group) do
      change_type id : Int32
    end
    alter table_for(Membership) do
      change_type id : Int32
      change_type group_id : Int32
      change_type user_id : Int32
    end
    alter table_for(User) do
      change_type id : Int32
    end
  end
end
