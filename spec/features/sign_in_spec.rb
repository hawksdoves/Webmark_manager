feature 'sign up' do
  scenario 'user count increase and personalised welcome message' do
    fill_in_sign_up
    fill_in('password_check', with: 'bobByg' )
    expect{click_button "Sign up"}.to change{User.count}.by 1
    expect(page).to have_content 'Welcome Bob!'
  end

  scenario 'cannot sign up if mismatching passwords' do
    fill_in_sign_up
    expect{click_button "Sign up"}.to change{User.count}.by 0
    expect(page).to have_content("Mismatching passwords, please try again.")
    expect(User.all).to be_empty
  end

  scenario 'should keep names and email saved if mismatching passwords' do
    fill_in_sign_up
    click_button "Sign up"
    expect(page).to have_selector('input[value="bob.by@gmail.com"]')
  end

  scenario 'should stay on sign in page, if email left empty' do
    visit '/'
    click_button ("Sign up")
    expect(page).to have_xpath("//input[@required='required']")
  end

  scenario 'will not accept invalid email' do
    visit '/sign-up'
    fill_in('first_name', with: 'Bob')
    fill_in('last_name', with: 'By')
    fill_in('email', with: 'bob.by@gmail' )
    fill_in('password', with: 'bobByg' )
    fill_in('password_check', with: 'bobByg' )
    expect{click_button "Sign up"}.to change{User.count}.by 0
  end 
end
