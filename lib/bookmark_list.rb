require_relative 'bookmark'

class BookmarkList
  def initialize
    @bookmarks = [
      Bookmark.new('The Internet', 'http://www.internet.com'),
      Bookmark.new('The Internet 2', 'http://www.also-internet.com'),
      Bookmark.new('The Internet 3', 'http://www.still-internet.com')
    ]
  end

  def all
    output = []
    @bookmarks.each do |bookmark|
      output << "#{bookmark.name}: #{bookmark.link}"
    end
    return output
  end
end