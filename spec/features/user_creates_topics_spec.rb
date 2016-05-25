require 'rails_helper'

RSpec.feature "User Creates Topic", type: :feature do
  scenario 'successfully' do
    user = create(:user)
    
    visit '/users/sign_in'
    expect(page).to have_css('h2', text: 'Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    expect(page).to have_text "Signed in as: #{user.email}"
    click_link 'New Topic'
    expect(page).to have_css('h1', text: 'New Topic')
    fill_in 'Enter topic title', with: 'News Articles'
    click_button 'Add Topic'
    expect(page).to have_text 'Topic successfully created'
    expect(page).to have_link 'News Articles'

  end
  
  scenario 'fails with invalid data' do
    user = create(:user)
    
    visit '/users/sign_in'
    expect(page).to have_css('h2', text: 'Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    expect(page).to have_text "Signed in as: #{user.email}"
    click_link 'New Topic'
    expect(page).to have_css('h1', text: 'New Topic')
    click_button 'Add Topic'
    expect(page).to have_text 'There was an error creating the Topic'
    expect(page).to have_css('h1', text: 'New Topic')
  end
end
