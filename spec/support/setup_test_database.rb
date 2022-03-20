require 'pg'

def setup_test_database(database_name = 'bookmark_manager_test')
  connection = PG.connect(dbname: database_name)
  create_command = "CREATE TABLE bookmarks (
    id SERIAL primary key,
    title VARCHAR(60),
    url VARCHAR(60),
    created timestamp with time zone default now()
  );"
  # Would this be better/faster if it created a table if it DID NOT exist?
  # Then truncate the one that is there
  connection.exec("DROP TABLE IF EXISTS bookmarks;")
  connection.exec(create_command)
end

def add_default_bookmarks_to_test_database(database_name = 'bookmark_manager_test')
  connection = PG.connect(dbname: database_name)
  defaults = [
    { 'title' => 'Makers', 'url' => 'https://www.makers.tech/' },
    { 'title' => 'BBC News', 'url' => 'https://www.bbc.co.uk/news' },
    { 'title' => 'The Nicest Place on the Internet', 'url' => 'https://thenicestplace.net/' }
  ]
  defaults.each do |default_entry|
    params = [default_entry['title'], default_entry['url']]
    connection.exec_params("INSERT INTO bookmarks (title, url) VALUES ($1, $2);", params)
  end
end
