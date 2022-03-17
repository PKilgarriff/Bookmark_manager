require_relative 'bookmark'
require 'pg'

class BookmarkList
  def initialize
    @bookmarks = []
  end

  def all
    output = []
    database_connection_and_query.each do |bookmark|
      output << "#{bookmark['title']}: #{bookmark['url']}"
    end
    return output
  end

  def database_connection_and_query
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    connection.exec "SELECT * FROM bookmarks"
  end
end
