require "rails_helper"

RSpec.feature "Rates page", :type => :feature do
  scenario "User visits rate page" do
    visit "/"

    expect(page).to have_text("Курс Валют за #{Date.current}")
    expect(page).to have_css('div#average-rates')
    expect(page).to have_css('div#rates-graph')
  end
end