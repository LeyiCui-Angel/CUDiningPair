Given('I visit the login page') do
    visit '/login'

end

When /^(?:|I )type in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in field, with: value

end

When /^(?:|I )click "([^"]*)"$/ do |button|
    click_button(button, wait: 5)

end

Then('I Log Out') do
	click_button('.btn.btn-primary', text: 'Log Out')

end

Then('I should be on the welcome page') do
    expect(current_path).to eq('/welcome/index')
    # or check for content that uniquely identifies the welcome page
    expect(page).to have_content('Welcome')
  end

Then /^(?:|I )see the error message "([^"]*)"$/ do |flash_message|
    expect(page).to have_content(flash_message)

end

Then(/^I can see "([^"]*)"$/) do |text|
    expect(page).to have_content(text)

end
