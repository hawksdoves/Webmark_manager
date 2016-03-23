feature 'sign up' do

  scenario 'user count increase and personalised welcome message' do
    visit '/'
    click_button ("Sign up")
    fill_in('first_name', with: 'Bob')
    fill_in('last_name', with: 'By')
    fill_in('email', with: 'bob.by@gmail.com' )
    fill_in('password', with: 'bobByg' )
    click_button("Sign up")
    expect(page).to have_content 'Welcome Bob!'
    expect(User.count).to change_by 1
  end

end