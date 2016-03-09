require 'rails_helper'

RSpec.feature "User views homepage" do
  scenario "they see existing links" do
    link = create(:link)

    visit root_path

    expect(page).to have_link link.title, href: link.url
  end

  scenario "the links are sorted from hottest to coldest" do
    hottest_link = create(:link, title: "hot", votes: 98, downvotes: 2)
    middle_link = create(:link, title: "middle", votes: 10, downvotes: 5)
    cold_link = create(:link, title: "cold", votes: 4, downvotes: 3)

    visit root_path

    expect(page).to have_css "#links li:nth-child(1)", text: "hot"
    expect(page).to have_css "#links li:nth-child(2)", text: "middle"
    expect(page).to have_css "#links li:nth-child(3)", text: "cold"
  end
end
