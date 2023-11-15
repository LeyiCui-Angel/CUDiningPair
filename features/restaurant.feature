Feature: restaurant filtering


Background: restaurants in database
  Given the following restaurants exist:
  | name         | rating | cuisine      | location      |
  | Restaurant A |   4.5  | hot spicy    | 123 Main St   |
  | Restaurant B |   3.8  | vege         | 456 Elm St    |
  | Restaurant C |   4.2  | not spicy    | 789 Oak St    |

  Given I visit the signup page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Given I visit the login page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I press "Login"
	  Then I should be on the welcome page

    

Scenario: edit restaurant 
    #Given I logged in 
    #Given I am on the welcome page
    #Then I should see "Restaurant"
    Given I am on the restaurants page
    Then I should see "More about Restaurant A"
    When I click "More about Restaurant A"
    Then I should see "Details about Restaurant A"
    When I click "Edit"
    Then I should see "Edit Existing Restaurant"
    And I fill in "Name" with "Bad Restaurant"
    And I fill in "Location" with "No Location"
    And I select "1" from "Rating"
    And I select "Vege" from "Cuisine"
    And I press "Update Restaurant Info"
    Then I should see "Bad Restaurant"
    Then I should see "No Location"
    Then I should see "1.0"
    Then I should see "Vege"
    When I click "Back to restaurant list"
    Then I should see "All Restaurants"
    Then I should not see "Restaurant A"



Scenario: delete restaurant
  Given I am on the details page for "Restaurant A"
  And   I press "Delete"
  Then I should not see "4.5"

Scenario: filter restaurant
  Given I am on the restaurants page
  And  I select "4" from "Rating"
  And I press "Filter"
  Then I should not see "Restaurant B"
  And I check "Not Spicy"
  And I uncheck "Hot Spicy"
  And I press "Filter"
  Then I should see "Restaurant C"
  Then I should not see "Restaurant A"

Scenario: create new restaurant
  Given I am on the restaurants page
  Then I click "Add new restaurant"
  And I fill in "Name" with "Bad Restaurant"
  And I fill in "Location" with "No Location"
  And I select "1" from "Rating"
  And I select "Vege" from "Cuisine"
  And I press "Save Changes"
  Then I should see "Bad Restaurant"
  Then I should see "No Location"
  Then I should see "1.0"
  Then I should see "Vege"

Scenario: cancel changes
  Given I am on the restaurants page
  Then I click "Add new restaurant"
  Then I click "Cancel"
  Then I should see "All Restaurants"
  Given I am on the details page for "Restaurant A"
  Then I click "Edit"
  Then I click "Cancel"
  Then I should see "All Restaurants"
  