require 'spec_helper'

feature 'User views a topic', %q{
} do
# Acceptance Criteria
#
  scenario 'User views a topic', js: true do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    fill_in 'title', with: 'Example Title'
    fill_in 'description', with: 'Example Description'
    click_on 'Create Topic'

    expect(page).to have_content('Example Title')
    expect(page).to have_content('Current Topics')
  end

end
