feature 'Bookmark List' do
  scenario 'displays a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('The Internet: http://www.internet.com/')
    expect(page).to have_content('The Internet 3: http://www.still-internet.com/')
    expect(page).to have_content('The Internet 4: http://www.what-more-internet.com/')
  end
end
