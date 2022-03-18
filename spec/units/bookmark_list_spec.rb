require 'bookmark_list'

describe BookmarkList do
  let(:fake_db_manager) { double(:db_manager_double, :query => 'The result of calling "SELECT * FROM bookmarks"') }
  subject(:bookmark_list) { described_class.new(fake_db_manager) }
  
  describe '#all_bookmarks' do
    it 'returns a list of bookmarks' do
      expect(bookmark_list.all_bookmarks).to eq fake_db_manager.query
    end
  end

  describe '#add_bookmark' do
    it 'adds a new bookmark to the database' do
      title, url = 'Test Bookmark', 'http://www.testing.com'
      sql_query = "INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}')"
      bookmark_list.add_bookmark(title, url)
      allow(fake_db_manager).to receive(:query)
      expect(fake_db_manager).to have_received(:query).with(sql_query)
    end
  end
end
