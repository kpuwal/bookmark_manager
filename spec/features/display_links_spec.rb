require 'spec_helper'

feature "displaying links" do
  scenario "list of links" do
    Link.create(url: 'http://www.google.com', title: 'google')
    visit ('/links')
    #expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content("google")
    end
  end

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario "list of tags" do
    visit('/tags/bubbles')

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
