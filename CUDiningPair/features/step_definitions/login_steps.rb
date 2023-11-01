Given('I visit the login page') do
    visit '/login'
end

When /^(?:|I )type in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

When /^(?:|I )click "([^"]*)"$/ do |button|
    click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )see the error message "([^"]*)"$/ do |flash_message|
    expect(page).to have_content(flash_message)
end