def fill_in_sign_up
  visit '/'
  click_button ("Sign up")
  fill_in('first_name', with: 'Bob')
  fill_in('last_name', with: 'By')
  fill_in('email', with: 'bob.by@gmail.com' )
  fill_in('password', with: 'bobByg' )
end