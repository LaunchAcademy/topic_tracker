require 'spec_helper'

feature 'User views a topic', %q{
} do
# Acceptance Criteria
#
  scenario 'User views a topic', js: true do
    topic1 = FactoryGirl.create(:topic)
    topic2 = FactoryGirl.create(:topic)
    topic3 = FactoryGirl.create(:topic)

    visit root_path

    expect(page).to have_content topic1.title
    expect(page).to have_content topic2.title
    expect(page).to have_content topic3.title
  end
end
