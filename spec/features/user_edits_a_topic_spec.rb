require 'spec_helper'

feature 'User edits a topic', %q{
} do
# Acceptance Criteria
#
  scenario 'User edits a  topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_on 'Create Topic'

    click_link 'Edit'
    fill_in 'Title', with: 'Example Title Edited'
    fill_in 'Description', with: 'Example Description Edited'
    fill_in 'Category', with: 'Example Category'
    click_on 'Update Topic'

    expect(page).to have_content('Your topic was successfully updated!')
    expect(page).to have_content('Example Category')
  end

  scenario 'User attempts to edit a topic that is not theirs' do
    user = FactoryGirl.create(:user)
    topic = FactoryGirl.create(:topic)

    sign_in_as(user)
    click_on "Sign Out"

    click_on 'Sign In With GitHub'
    visit root_path
    click_link 'Edit'

    expect(page).to have_content('Not your post!')
  end

  def sign_in_as(user)
    OmniAuth.config.add_mock(:github, {uid: user.uid, name: user.name})
    visit root_path
    click_on "Sign In With GitHub"
  end

end
