require_relative 'bookmark'
require 'pg'

class BookmarkList
  def initialize
    @bookmarks = []
  end

  def all
    output = []
    database_query.each do |bookmark|
      output << "#{bookmark['title']}: #{bookmark['url']}"
    end
    return output
  end

  def database_connection
    db_name = ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    connection = PG.connect(dbname: db_name)
  end

  def database_query(sql_query = "SELECT * FROM bookmarks")
    database_connection.exec(sql_query)
  end
end
