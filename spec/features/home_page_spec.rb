feature 'Add link to BOOKMARKS' do
  scenario 'Click Add Link and submit' do
    visit '/links'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    click_button("Save")
      expect(page).to have_link 'NME'

  end
end
