feature 'Bookmark List' do
  scenario 'displays a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_link('The Internet', :href => 'http://www.internet.com/')
    expect(page).to have_link('The Internet 3', :href => 'http://www.still-internet.com/')
    expect(page).to have_link('The Internet 4', :href => 'http://www.what-more-internet.com/')
  end
end
