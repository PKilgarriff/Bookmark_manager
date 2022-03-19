require 'bookmark_list'

describe BookmarkList do
  let(:fake_bookmark) { { :title => 'Test Title', :url => 'www.test-url.com' } }
  let(:fake_bookmark_template) { double(:bookmark_class_double, :new => fake_bookmark) }
  let(:fake_db_manager) { double(:db_manager_double, :query => [fake_bookmark]) }
  subject(:bookmark_list) { described_class.new(fake_db_manager) }
  
  describe '#all_bookmarks' do
    it 'returns a list of bookmarks' do
      expect(bookmark_list.all_bookmarks.first).to respond_to(:title)
      expect(bookmark_list.all_bookmarks.first).to respond_to(:url)
    end
  end

  describe '#add_bookmark' do
    it 'adds a new bookmark to the database' do
      title, url = 'Test Bookmark', 'http://www.testing.com'
      sql_query = "INSERT INTO bookmarks (title, url) VALUES ($1, $2)"
      params = [title, url]
      bookmark_list.add_bookmark(title, url)
      allow(fake_db_manager).to receive(:query)
      expect(fake_db_manager).to have_received(:query).with(sql_query, params)
    end
  end

  describe '#delete_bookmark' do
    it 'removes a bookmark from the database' do
      id = 1
      sql_query = "DELETE FROM bookmarks WHERE id = $1"
      params = [id]
      bookmark_list.delete_bookmark(id)
      allow(fake_db_manager).to receive(:query)
      expect(fake_db_manager).to have_received(:query).with(sql_query, params)
    end
  end
end
