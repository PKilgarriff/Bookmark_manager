feature 'Bookmark List' do
  scenario 'displays a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_link('Makers', :href => 'https://www.makers.tech/')
    expect(page).to have_link('BBC News', :href => 'https://www.bbc.co.uk/news')
    expect(page).to have_link('The Nicest Place on the Internet', :href => 'https://thenicestplace.net/')
  end
end
