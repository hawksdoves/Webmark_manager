feature 'filter by tag' do
  scenario 'user should be able to filter links by tag' do
    Link.create(url: "http://www.theguardian.co.uk", title: "The Guardian", tags: [Tag.first_or_create(tag: 'news')])
    Link.create(url: "http://www.google.com", title: "Google", tags: [Tag.first_or_create(tag: 'bubbles')])

    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content 'The Guardian'
      expect(page).to have_content 'Google'
    end
  end
end
