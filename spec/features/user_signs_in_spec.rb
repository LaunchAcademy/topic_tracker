require 'spec_helper'

feature 'sign in with GitHub', %Q{
        As a user
        I would like to log in with GitHub
        So I can use the Apollo Topic Tracker
        }  do

  # Acceptance Criteria:
  #
  #
  #


  scenario 'login via github' do
    visit root_path
    click_on 'Sign In With GitHub'

    expect(page).to have_content('Signed in as Bob Example!')
  end


end
