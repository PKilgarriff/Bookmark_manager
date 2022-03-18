require 'bookmark_list'

describe BookmarkList do
  subject(:bookmark_list) { described_class.new }
  
  it 'returns a list of bookmarks' do
    expect(bookmark_list.all_bookmarks).to be_instance_of(PG::Result)
  end
end
