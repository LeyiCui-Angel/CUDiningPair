Given('I visit the signup page') do
    visit '/signup'
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
    click_button(button)
end

Then /^(?:|I )should see label "([^"]*)"$/ do |text|
    label = find('label', text: label_text)
    expect(label).to be_visible
end

Then /^(?:|I )should see flash message "([^"]*)"$/ do |flash_message|
    expect(page).to have_content(flash_message)
end
  