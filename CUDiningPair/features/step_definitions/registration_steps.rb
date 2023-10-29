Given('I visit the signup page') do
    visit '/signup'
  end
  
When('I fill in {string} with {string}') do |field, value|
    fill_in field, with: value
end
  
When('I press {string}') do |button|
    click_button button
end
  
Then('I should see {string}') do |text|
    expect(page).to have_content(text)
end
  