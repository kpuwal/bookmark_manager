feature 'use a sing out' do
   let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end
  scenario 'user can sign out' do 
    sign_in(email: user.email,   password: user.password)
    visit('/links')
    click_button 'Sign out'
    expect(page).to have_content "You have signed out"
    expect(current_path).to eq('/links')
  end
end