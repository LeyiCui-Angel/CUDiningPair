Feature: User Registration

  Scenario: User registers with valid details
    Given I visit the signup page
    When I fill in "UNI" with "user1234"
    And I fill in "Password" with "password123"
    And I press "Sign Up"
    Then I should see "Verification email sent. Enter the 6-digit code."

  Scenario: User registers with invalid details
    Given I visit the signup page
    When I fill in "UNI" with ""
    And I fill in "Password" with "password123"
    And I press "Sign Up"
    Then I should see "Invalid UNI, try again."

