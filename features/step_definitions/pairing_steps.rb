Given ("I am on Pairings page") do
  visit '/pairings'
end

When("I set the meeting time to December") do
  # Assuming you have a form field with the id 'pairing_meeting_time'
  select 'December', from: 'pairing_meeting_time_2i'
end

When("I select {string} from the restaurant dropdown") do |restaurant_name|
  select restaurant_name, from: 'pairing_restaurant_id' # Replace 'pairing_restaurant_id' with the actual ID or name of your dropdown
end

When(/^I clicking the "Join" button$/) do
  pairing = Pairing.last # Or obtain the pairing in some way
  visit join_pairing_path(pairing)
end
