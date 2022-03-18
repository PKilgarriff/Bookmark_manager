feature 'Home Page' do
  scenario 'infrastructure is set up correctly' do
    visit('/')
    expect(page).to have_content('Hello World!')
    expect(page).to have_button('List Bookmarks')
    expect(page).to have_button('Add Bookmark')
  end
end
