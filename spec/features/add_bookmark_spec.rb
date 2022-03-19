feature 'Add Bookmark' do
  scenario 'opens a new bookmark entry screen' do
    visit('/')
    click_button('Add Bookmark')
    expect(page).to have_field('title')
    expect(page).to have_field('url')
  end

  scenario 'adds a new bookmark that is then visible in the list' do
    visit('/')
    click_button('Add Bookmark')
    title, url = 'Test Bookmark', 'http://www.testing.com'
    fill_in 'title', with: title
    fill_in 'url', with: url
    click_button('Submit')
    expect(page).to have_link(title.to_s, :href => url.to_s)
  end
end
