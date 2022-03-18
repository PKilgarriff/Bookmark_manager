require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Would this be better/faster if it created a table if it DID NOT exist?
  # Then truncate the one that is there
  connection.exec("DROP TABLE IF EXISTS bookmarks;")
  connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));")
end

def add_default_bookmarks_to_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  defaults = [
    "'The Internet', 'http://www.internet.com/'",
    "'The Internet 3', 'http://www.still-internet.com/'",
    "'The Internet 4', 'http://www.what-more-internet.com/'"
  ]
  defaults.each do |default_entry|
    connection.exec("INSERT INTO bookmarks (title, url) VALUES (#{default_entry});")
  end
end
