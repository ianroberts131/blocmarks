require 'rails_helper'

RSpec.feature "User Edits Topics", type: :feature do
  scenario "successfully" do
    user = create(:user)
    
    visit '/users/sign_in'
    expect(page).to have_css('h2', text: 'Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    expect(page).to have_text "Signed in as: #{user.email}"
    click_link 'New Topic'
    fill_in 'Enter topic title', with: 'News Articles'
    click_button 'Add Topic'
    
    click_link 'News Articles'
    expect(page).to have_css('h1', text: 'News Articles')
    click_link 'Edit Topic'
    expect(page).to have_css('h1', text: 'Edit Topic')
    fill_in 'Enter topic title', with: 'Cool News Articles'
    click_button 'Submit Topic'
    expect(page).to have_text 'Topic successfully updated'
    expect(page).to have_text 'Cool News Articles'
  end
end
