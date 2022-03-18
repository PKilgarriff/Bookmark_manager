require_relative 'bookmark'
require_relative 'database_manager'

class BookmarkList
  def initialize(database_manager = DatabaseManager)
    @db_manager = database_manager
    @bookmarks = []
  end

  def all_bookmarks
    @db_manager.query("SELECT * FROM bookmarks")
  end

  def add_bookmark(title, url)
    sql_query = "INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}')"
    @db_manager.query(sql_query)
  end
end
