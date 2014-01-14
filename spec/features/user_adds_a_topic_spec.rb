require 'spec_helper'

feature 'User adds a topic', %q(
As a user,
I would like to add a topic,
so that it can be discussed during a workshop.) do
# Acceptance Criteria
# I go to the “Add a Topic” page and enter the following information into a form
# The topic headline
# The topic description
# The topic category
# I click “Create Topic” and the topic is created and posted to the index page.

  scenario 'User creates a valid topic' do
    visit root_path
    click_link 'Sign In With GitHub'
    click_button 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_button 'Create Topic'

    expect(page).to have_content('Your topic was successfully created!')
  end

  scenario 'User attempts to create an invalid topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_button 'Create a Topic'
    click_button 'Create Topic'

    expect(page).to have_content("can't be blank")
  end
end
