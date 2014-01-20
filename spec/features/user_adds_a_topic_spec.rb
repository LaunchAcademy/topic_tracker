require 'spec_helper'

feature 'User adds a topic', %q{
As a user,
I would like to add a topic,
so that it can be discussed during a workshop.}, js: true do
# Acceptance Criteria
# I go to the “Add a Topic” page and enter the following information into a form
# The topic headline
# The topic description
# The topic category
# I click “Create Topic” and the topic is created and posted to the index page.

  scenario 'User creates a valid topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    fill_in 'title', with: 'Example Title'
    fill_in 'description', with: 'Example Description'
    click_on 'Create Topic'

    expect(page).to have_content('Example Title')
    expect(page).to have_content('Current Topics')
    expect(Topic.last.title).to eql('Example Title')
  end

  scenario 'User attempts to create an invalid topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    click_on 'Create Topic'

    expect(page).to have_content("can't be blank")
  end
end
