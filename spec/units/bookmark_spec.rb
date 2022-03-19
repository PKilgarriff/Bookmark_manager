require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new(1, 'The Internet', 'http://www.internet.com') }
  
  it 'stores the id' do
    expect(bookmark.id).to eq 1
  end
  
  it 'stores the title' do
    expect(bookmark.title).to eq 'The Internet'
  end
  
  it 'stores the url' do
    expect(bookmark.url).to eq 'http://www.internet.com'
  end
end
