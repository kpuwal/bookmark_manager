feature 'Adding tag' do

  scenario 'I can add a new tag' do
    visit ('/links/new')
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Add link'