require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("DROP TABLE IF EXISTS bookmarks;")
  connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));")
end

def add_default_bookmarks_to_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  
  connection.exec("INSERT INTO bookmarks (title, url) VALUES ('The Internet 4', 'http://www.what-more-internet.com/');")
  connection.exec("INSERT INTO bookmarks (title, url) VALUES ('The Internet 3', 'http://www.still-internet.com/');")
  connection.exec("INSERT INTO bookmarks (title, url) VALUES ('The Internet', 'http://www.internet.com/');")
end