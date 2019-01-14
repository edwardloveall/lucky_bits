class CreateFollows::V20181230163025 < LuckyRecord::Migrator::Migration::V1
  def migrate
    create :follows do
      add_belongs_to from : User, on_delete: :cascade
      add_belongs_to to : User, on_delete: :cascade
      add accepted_at : Time?
    end
  end

  def rollback
    drop :follows
  end
end