feature 'Filter by tag' do

  scenario 'Click tag and view links with tag' do
    Link.create(href: 'http://www.google.com', title: 'Google Search', tags: [Tag.first_or_create(name: 'search')] )
    Link.create(href: 'http://maps.google.com', title: 'Google Maps', tags: [Tag.first_or_create(name: 'maps')] )
    visit '/links'
    click_link("maps")
    within 'ul#links' do
      expect(page).to have_link 'Google Maps'
      expect(page).not_to have_link 'Google Search'
    end
  end

end
