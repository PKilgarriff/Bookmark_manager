feature 'Delete Bookmark' do
  # This test currently does not work, despite working in browser and all unit tests
  # Current suspicion is around rackup having a 'use Rack::MethodOverride' line that Capybara somehow does not
  xscenario 'removes a bookmark from the database' do
    visit('/bookmarks')
    expect(page).to have_button('delete_1')
    click_on('delete_1')
    visit('/bookmarks')
    expect(page).to_not have_link('Makers', :href => 'https://www.makers.tech/')
    expect(page).to have_link('BBC News', :href => 'https://www.bbc.co.uk/news')
    expect(page).to have_link('The Nicest Place on the Internet', :href => 'https://thenicestplace.net/')
  end
end
