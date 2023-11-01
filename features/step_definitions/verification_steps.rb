Given('I visit the verification page') do
    visit '/verification'
end

And /^(?:|I )put down "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

Then /^(?:|I )should see flash error message "([^"]*)"$/ do |flash_message|
    expect(page).to have_content(flash_message)
end

And /^(?:|I )move by clicking "([^"]*)"$/ do |button|
    click_button(button)
end

Then /^(?:|I )should see a sentence "([^"]*)"$/ do |text|
	if page.respond_to? :should
	  page.should have_content(text)
	else
	  assert page.has_content?(text)
	end
end