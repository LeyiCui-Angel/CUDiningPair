Feature: Joining pair

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

  Given I visit the signup page
    When I fill in "UNI" with "ab123"
    And I fill in "Password" with "ab123"
    And I fill in "Password confirmation" with "ab123"
    And I press "Sign up"

  Given I visit the signup page
    When I fill in "UNI" with "bc456"
    And I fill in "Password" with "bc456"
    And I fill in "Password confirmation" with "bc456"
    And I press "Sign up"

  Given I visit the login page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I press "Login"
	  Then I should be on the welcome page

Scenario: pairings page check 
    Given I am on Pairings page
    Then I should see "No pairings available"
    And I click "Add a new pairing"
    Then I should see "Create New Pairing"
    Then I fill in "Target Number of People" with "0"
    And I press "Create Pairing"
    Then I should see "Create New Pairing"
    Then I fill in "Target Number of People" with "2"
    And I press "Create Pairing"
    Then I should see "Create New Pairing"
    Then I set the meeting time to 2025
    And I press "Create Pairing"
    Then I should see "Pairing created successfully"
    And I clicking the "Join" button
    Then I should see "You are already part of this pairing"
    Then I click "Back to Welcome Page"
    And I press "Log Out"
    Given I visit the login page
    When I fill in "UNI" with "ab123"
    And I fill in "Password" with "ab123"
    And I press "Login"
    Given I am on Pairings page
    And I clicking the "Join" button    
    And I click "More about this pairing"
    Then I should see "ab123"
    Then I should see "user12345"
    And I click "Edit"
    And I fill in "Target Number of People" with "2"
    And I press "Update Pairing Info"
    Then I should see "Pairing was successfully updated"
    And I click "Back to pairings list"
    Then I should see "Full"





                   

    



 