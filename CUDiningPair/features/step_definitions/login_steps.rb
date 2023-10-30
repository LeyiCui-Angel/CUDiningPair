Given('I visit the login page') do
    visit '/login'
end

When /^(?:|I )type in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

When /^(?:|I )click "([^"]*)"$/ do |button|
    click_button(button)
end

Then /^(?:|I )should see heading "([^"]*)"$/ do |heading_text|
	expect(page).to have_selector('h1', text: heading_text)
end

Then /^(?:|I )should not see heading "([^"]*)"$/ do |heading_text|
	expect(page).not_to have_selector('h1', text: heading_text)
end

Then('I should be in the login page') do
	visit '/login'
end 