# This migrates all bit data from the legacy site to the new one. It requires
# that there is:
#
# * A group named "LinkyBits"
# * An environment variable called "LEGACY_DATABASE_URL" that is set to the URL
#   of the legacy database
# * Two users on both systems that have matching usernames to map each bit to
#
# This connects to the foreign database and creates all the same bits in a
# group called LuckyBits. It maps the user to one of the same username and
# keeps all the timestamps, but it does not keep the bit IDs.

class Db::MigrateLegacyData < LuckyCli::Task
  @user_id_map = {} of Int32 => Int64

  summary <<-TEXT
    LuckyBits was originally a project built in rails.
    This will migrate that data.
  TEXT

  def call
    group = GroupQuery.new.title("LinkyBits").first?
    if group.nil?
      raise "There must be a group called LinkyBits"
    end
    items = Item::BaseQuery.new.preload_user
    items.each do |item|
      SaveBit.create!(
        title: item.title,
        url: item.url,
        description: item.description,
        user_id: new_user_id(item.user_id),
        group_id: group.id,
        created_at: item.created_at,
        updated_at: item.updated_at,
      )
    end
  end

  private def new_user_id(old_user_id : Int32) : Int64
    user_id_map[old_user_id]
  end

  private def user_id_map
    if @user_id_map.empty?
      users = LegacyUser::BaseQuery.new
      @user_id_map = users.map do |user|
        {user.id, UserQuery.new.username(user.username).first.id}
      end.to_h
    end
    @user_id_map
  end
end

class LegacyDatabase < Avram::Database
end

LegacyDatabase.configure do |settings|
  settings.url = ENV.fetch("LEGACY_DATABASE_URL", "not gonna work")
end

abstract class LegacyModel < Avram::Model
  macro default_columns
    primary_key id : Int32
    timestamps
  end

  def self.database
    LegacyDatabase
  end
end

class LegacyUser < LegacyModel
  table :users do
    column username : String
  end
end

class Item < LegacyModel
  table :items do
    column title : String
    column description : String
    column url : String
    belongs_to user : LegacyUser
  end
end
