class AddFeedTokenToUser::V20190111132118 < LuckyRecord::Migrator::Migration::V1
  def migrate
    alter :users do
      add feed_token : String, fill_existing_with: "invalid-token"
    end
  end

  def rollback
    alter :users do
      remove :feed_token
    end
  end
end
