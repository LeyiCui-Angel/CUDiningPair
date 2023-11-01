require 'rails_helper'

RSpec.feature 'User registration', type: :feature do
  scenario 'user registers with valid details' do
    visit '/signup'
    fill_in 'UNI', with: 'user1234'
    fill_in 'Password', with: 'password123'
    click_button 'Sign Up'
    expect(page).to have_content('Verification email sent. Enter the 6-digit code.')
  end

  scenario 'user registers with invalid details' do
    visit '/signup'
    fill_in 'UNI', with: ''
    fill_in 'Password', with: 'password123'
    click_button 'Sign Up'
    expect(page).to have_content('Invalid UNI, try again.')
  end
end
