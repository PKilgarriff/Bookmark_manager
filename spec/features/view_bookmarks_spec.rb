feature 'Bookmark List' do
  scenario 'displays a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('The Internet: http://www.internet.com')
  end
end

