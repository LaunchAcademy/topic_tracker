require 'spec_helper'

feature 'User views a topic', %q{
} do
# Acceptance Criteria
#
  scenario 'User views a topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_on 'Create Topic'
    visit root_path

    expect(page).to have_content('Example Title')
    expect(page).to have_content('Example Description')
  end

end
