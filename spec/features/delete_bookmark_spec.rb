feature 'Delete Bookmark' do
  scenario 'removes a bookmark from the database' do
    visit('/bookmarks')
    click_on('delete_1')
    expect(page).not_to have_link('The Internet', :href => 'http://www.internet.com/')
  end
end
