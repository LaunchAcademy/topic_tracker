require 'spec_helper'

feature 'user votes for a topic', %Q{

        }  do

  # Acceptance Criteria:
  #
  #
  #


  scenario 'user votes for a topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_button 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_button 'Create Topic'
    click_button 'Vote Up'

    expect(page).to have_content('Upvoted successfully!')
    expect(page).to have_button('Remove Vote')
  end

  scenario 'user votes for a topic' do
    visit root_path
    click_on 'Sign In With GitHub'
    click_button 'Create a Topic'
    fill_in 'Title', with: 'Example Title'
    fill_in 'Description', with: 'Example Description'
    click_button 'Create Topic'
    click_button 'Vote Up'
    click_button 'Remove Vote'

    expect(page).to have_content('Vote removed.')
    expect(page).to have_button('Vote Up')
  end


end
