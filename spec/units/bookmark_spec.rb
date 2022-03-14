require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new('The Internet', 'http://www.internet.com') }
  
  it 'stores a name' do
    expect( bookmark.name ).to eq 'The Internet'
  end
  
  it 'stores a link' do
    expect( bookmark.link ).to eq 'http://www.internet.com'
  end
end