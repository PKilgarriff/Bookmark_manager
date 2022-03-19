require_relative 'bookmark'
require_relative 'database_manager'

class BookmarkList
  def initialize(database_manager = DatabaseManager, bookmark_template = Bookmark)
    @db_manager = database_manager
    @bookmark_template = bookmark_template
  end
  
  def all_bookmarks
    bookmarks = []
    @db_manager.query("SELECT * FROM bookmarks", []).each do |bookmark|
      bookmarks << @bookmark_template.new(bookmark['title'], bookmark['url'])
    end
    return bookmarks
  end

  def add_bookmark(title, url)
    sql_query = "INSERT INTO bookmarks (title, url) VALUES ($1, $2)"
    @db_manager.query(sql_query, [title, url])
  end
end
