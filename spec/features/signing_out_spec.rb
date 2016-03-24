feature 'sign out' do
  scenario 'will say goodbye to the user' do
    fill_in_sign_up
    fill_in('password_confirmation', with: 'bobByg' )
  	click_button ("Sign up")
    click_button ("Log out")
    expect(page).to have_button('Log in')
  end
end
