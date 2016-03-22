feature 'filter by tag' do
  scenario 'user should be able to filter links by tag' do
    visit '/links/new'
    fill_in :title, with: "The Guardian"
    fill_in :url, with: "http://www.theguardian.co.uk"
    fill_in :tag, with: "News"
    click_button "Submit"
     visit '/links/new'
    fill_in :title, with: "Google"
    fill_in :url, with: "http://www.google.co.uk"
    fill_in :tag, with: "bubbles"
    click_button "Submit"
    visit '/tags/bubbles'

    within 'ul#bubble_links' do
      expect(page).not_to have_content 'The Guardian'
      expect(page).to have_content 'Google'
    end
  end
end
