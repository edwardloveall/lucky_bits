class GenerateUsernamesForUsers::V20190120141952 < LuckyRecord::Migrator::Migration::V1
  class TempUser < BaseModel
    table :users do
      column email : String
      column username : String?
    end
  end

  def migrate
    TempUser::BaseQuery.all.each do |user|
      new_username = user.email.split("@").first
      TempUser::BaseForm.update!(user, username: new_username)
      puts "Generated username #{new_username} for #{user.email}"
    end
  end

  def rollback
  end
end
