Feature: welcome page

Background: login
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

Scenario: testing links
    Given I am on the welcome page
    Then I should see "This is your home page"
    And I click "UNI: user12345"
    Then I should see "User Profile"

Scenario: testing restaurant
    Given I am on the welcome page
    And I click "Restaurants"
    Then I should see "All Restaurants"
    And I click "Back to Welcome Page"
    Then I should see "This is your home page"
    
Scenario: log Out
    Given I am on the welcome page
    And I press "Log Out"
    Then I should see "Not registered? Sign up here"