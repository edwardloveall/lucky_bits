class GenerateUsernamesForUsers::V20190120141952 < Avram::Migrator::Migration::V1
  def migrate
    user_tuple = {Int32, String}

    AppDatabase.run do |db|
      user_results = db.query_all("SELECT id, email FROM users;", as: user_tuple)
      values = user_results.map do |result|
        id, email = result
        username = email.split("@").first
        "(#{id}, '#{username}')"
      end.join(',')

      if !values.empty?
        execute <<-SQL
          UPDATE users
          SET username = user_values.username
          FROM (values #{values}) AS user_values(id, username)
          WHERE users.id = user_values.id
        SQL
      end
    end
  end

  def rollback
  end
end
