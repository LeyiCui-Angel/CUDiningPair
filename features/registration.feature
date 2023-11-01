Feature: User Registration and login

  Scenario: User registers with valid details
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

  
  Scenario: User login with invalid details
    Given I visit the signup page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Given I visit the login page
    Given I visit the login page
    When I fill in "UNI" with "ab123"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I should see flash message "Invalid UNI/password combination"

  Scenario: User registers with invalid details
    Given I visit the signup page
    When I fill in "UNI" with ""
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Then I should see flash message "Uni cannot be empty"
  
  Scenario: User register with existing data
    Given I visit the signup page
    When I fill in "UNI" with "ab123"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password1234"
    And I press "Sign up"
    Then I should see flash message "Passwords do not match!"

