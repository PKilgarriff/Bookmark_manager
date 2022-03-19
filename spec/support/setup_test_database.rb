require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  create_command = "CREATE TABLE bookmarks (
    id SERIAL primary key,
    title VARCHAR(60),
    url VARCHAR(60),
    created timestamp with time zone default now()
  );"
  # Would this be better/faster if it created a table if it DID NOT exist?
  # Then truncate the one that is there
  connection.exec("DROP TABLE IF EXISTS bookmarks;")
  # connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));")
  connection.exec(create_command)
end

def add_default_bookmarks_to_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  defaults = [
    { 'title' => 'The Internet', 'url' => 'http://www.internet.com/' },
    { 'title' => 'The Internet 3', 'url' => 'http://www.still-internet.com/' },
    { 'title' => 'The Internet 4', 'url' => 'http://www.what-more-internet.com/' }
  ]
  defaults.each do |default_entry|
    connection.exec_params("INSERT INTO bookmarks (title, url) VALUES ($1, $2);", [default_entry['title'],default_entry['url']])
  end
end
