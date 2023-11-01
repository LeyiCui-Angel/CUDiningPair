Given('I visit the signup page') do
    visit '/signup'
end

Given('I visit the login page') do
    visit '/login'
end

Then ('I should be on the welcome page') do
    expect(current_path).to eq(welcome_index_path)
    # or check for content that uniquely identifies the welcome page
    # expect(page).to have_content('Welcome')
end

Then ('I should be back on the signup page') do
    expect(current_path).to eq(signup_path)
end

Then /^(?:|I )should see label "([^"]*)"$/ do |text|
    label = find('label', text: label_text)
    expect(label).to be_visible
end

Then /^(?:|I )should see flash message "([^"]*)"$/ do |flash_message|
    expect(page).to have_content(flash_message)
end

