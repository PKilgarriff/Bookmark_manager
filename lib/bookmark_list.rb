require_relative 'bookmark'
require 'pg'

class BookmarkList
  def initialize
    @bookmarks = []
  end

  def all_bookmarks
    database_query("SELECT * FROM bookmarks")
  end

  def database_connection
    db_name = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    connection = PG.connect(dbname: db_name)
  end

  def database_query(sql_query = "SELECT * FROM bookmarks")
    database_connection.exec(sql_query)
  end
end
