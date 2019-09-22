require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  scenario "Correctly displays Articles" do
    visit articles_path
    expect(page).to have_content 'Recent Articles'
  end

  scenario "Correctly filters Articles by publishing status" do
    visit "/articles"
  end
end
