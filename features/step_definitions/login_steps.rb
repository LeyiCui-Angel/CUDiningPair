Given('I visit the login page') do
    visit '/login'

end

When /^(?:|I )type in "([^"]*)" with "([^"]*)"$/ do |field, value|
    field_id = case field
               when "UNI" then "session_uni"
               when "Password" then "session_password"
               else field
               end
    
    expect(page).to have_css("##{field_id}", visible: true)
    fill_in(field_id, with: value)
end  

When /^(?:|I )click on button "([^"]*)"$/ do |button|
    click_button(button, wait: 5)
end

Then('I Log Out') do
	click_button('.btn.btn-primary', text: 'Log Out')

end

Then('I should be on the welcome page') do
    expect(current_path).to eq(welcome_index_path)
    # or check for content that uniquely identifies the welcome page
    # expect(page).to have_content('Welcome')
  end

Then(/^I can see "([^"]*)"$/) do |text|
    expect(page).to have_content(text)

end
