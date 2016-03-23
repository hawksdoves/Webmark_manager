feature 'Add link to BOOKMARKS' do

  scenario 'Click Add Link and submit' do
    visit '/links'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    click_button("Save")
    within 'ul#links' do
      expect(page).to have_link 'NME'
    end
  end

end

feature 'Add one tag to a link' do
	
  scenario 'can add tags when saving new links' do
    visit '/links'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    fill_in('tag', with: 'music' )
    click_button("Save")
    within 'ul#links' do
    	expect(page).to have_content 'music'
    end
  end

end
