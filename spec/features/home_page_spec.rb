feature 'home page' do
  scenario 'can redirect to sign up page' do
  	visit '/'
  	click_button ("Sign up")
    expect(page).to have_content 'Sign up'
  end

  scenario 'can redirect to log in page' do
	visit '/'
  	click_button ("Log in")
    expect(page).to have_content 'Log in'
  end

end