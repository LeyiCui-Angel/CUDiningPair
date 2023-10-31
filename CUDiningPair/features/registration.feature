Feature: User Registration

  Scenario: User registers with valid details
    Given I visit the signup page
    When I fill in "UNI" with "user12345"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Then I should see label "Verification code"

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

