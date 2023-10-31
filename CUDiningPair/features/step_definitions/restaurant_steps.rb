Given /the following restaurants exist/ do |restaurants_table|
    restaurants_table.hashes.each do |restaurant|
        Restaurant.create restaurant
    end
  end

Given ("I logged in") do
    visit '/login'
    fill_in("UNI", :with => "ab123")
    fill_in("Password", :with => "ab123")
    click_button("Login")
end

Given ("I am on the welcome page") do
    visit '/welcome/index'
end

Then(/^I should (not )?see "([^"]*)"$/) do |negation, text|
    if negation.nil?
      assert_text(text)
      # Or use expect(page).to have_text(text) if you prefer the alternative syntax
    else
      assert_no_text(text)
      # Or use expect(page).not_to have_text(text) if you prefer the alternative syntax
    end
  end

Given ("I am on the restaurants page") do
    visit '/restaurants'
end

When (/^I click "([^"]*)"$/) do |link|
    click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
    select(value, :from => field)
end

When (/^I press "([^"]*)"$/) do |button|
    click_button(button)
end

Given /^I am on the details page for "([^"]*)"$/ do |restaurant_name|
    restaurant = Restaurant.find_by(name: restaurant_name)
    visit restaurant_path(restaurant)
end

When(/^I (un)?check "([^"]*)"$/) do |uncheck, checkbox_label|
    if uncheck
      uncheck(checkbox_label)
    else
      check(checkbox_label)
    end
end