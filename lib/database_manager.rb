require 'pg'

class DatabaseManager
  def self.setup(pg = PG)
    db_name = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    @connection = pg.connect(dbname: db_name)
  end

  def self.connection
    @connection = @connection ||= setup
  end

  def self.query(sql_query = "SELECT * FROM bookmarks", *params)
    connection.exec_params(sql_query, params)
  end
end
