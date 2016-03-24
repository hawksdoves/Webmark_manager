feature 'log in' do
  scenario 'and personalised welcome message' do
  	fill_in_sign_up
  	fill_in('password_confirmation', with: 'bobByg' )
  	click_button ("Sign up")
  	visit '/log-in'
  	fill_in('email', with: 'bob.by@gmail.com' )
    fill_in('password', with: 'bobByg' )
    click_button ("Log-in")
    expect(page).to have_content "Welcome Bob"
  end
end
