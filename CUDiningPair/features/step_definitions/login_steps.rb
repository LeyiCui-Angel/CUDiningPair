Given('I visit the login page') do
    visit '/login'
end

When /^(?:|I )type in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

When /^(?:|I )click "([^"]*)"$/ do |button|
    click_button(button)
end

Then('I Log Out') do
	click_button('.btn.btn-primary', text: 'Log Out')
end

Then('I should visit welcome page') do
	visit '/welcome/index'
end

Then /^(?:|I )see the error message "([^"]*)"$/ do |flash_message|
    expect(page).to have_content(flash_message)
end
