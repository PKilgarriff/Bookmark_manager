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
    connection = PG.connect :dbname => 'bookmark_manager'
    connection.exec "SELECT * FROM bookmarks"
  end
end
