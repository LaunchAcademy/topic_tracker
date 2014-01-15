require 'spec_helper'

feature 'User deletes a topic', %q{
} do
# Acceptance Criteria
#
  scenario 'User deletes a topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_on 'Create Topic'
    click_on 'Delete'

    expect(page).to have_content('Topic successfully destroyed')
  end

   scenario 'User attempts to delete a topic that is not theirs' do
    user = FactoryGirl.create(:user)
    topic = FactoryGirl.create(:topic)

    sign_in_as(user)
    click_on "Sign Out"

    click_on 'Sign In With GitHub'
    visit root_path
    click_link 'Delete'

    expect(page).to have_content('Not your post!')
  end

  def sign_in_as(user)
    OmniAuth.config.add_mock(:github, {uid: user.uid, name: user.name})
    visit root_path
    click_on "Sign In With GitHub"
  end

  scenario 'User attempts to delete a topic when not signed in' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_on 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_on 'Create Topic'
    click_on 'Sign Out'
    click_on 'Delete'

    expect(page).to have_content('Must sign in!')
  end
end
