Feature: User Registration and login

  Scenario: User registers with valid details and successfully logged in
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


  Scenario: User registers with valid details but failed logging in
    Given I visit the signup page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Given I visit the login page
    When I fill in "UNI" with "ab123"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I should see flash message "Invalid UNI/password combination"

  Scenario: User registers with invalid details - no uni
    Given I visit the signup page
    When I fill in "UNI" with ""
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Then I should see flash message "Uni cannot be empty"
    Then I should be back on the signup page
  
  Scenario: User registers with invalid details - wrong password
    Given I visit the signup page
    When I fill in "UNI" with "ab123"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password1234"
    And I press "Sign up"
    Then I should see flash message "Passwords do not match!"
    Then I should be back on the signup page

 Scenario: User register with existing data
    Given I visit the signup page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Given I visit the signup page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Then I should see flash message "You have already registered with this UNI!"
    Then I should be back on the signup page