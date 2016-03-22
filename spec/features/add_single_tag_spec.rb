feature 'Add single tag' do
  scenario 'user should be able to add a single tag to link' do
    visit '/links/new'
    fill_in :title, with: "The Guardian"
    fill_in :url, with: "http://www.theguardian.co.uk"
    fill_in :tag, with: "News"
    click_button "Submit"

    within 'ul#links' do
      expect(page).to have_content 'News'
    end
  end
end
