feature 'Home Page' do
  scenario 'infrastructure is set up correctly' do
    visit('/')
    expect(page).to have_content('Hello World')
  end
end
