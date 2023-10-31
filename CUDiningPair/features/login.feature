Feature: User Login

  Scenario: User login valid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "ab123"
    And I click "Login"
    Then I can see "successfully logged in"
    Then I should be on the welcome page
    Then I see the error message "Invalid email/password combination"
    Then I can see "This is the landing page."

  Scenario: User login with invalid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "123"
    And I click "Login"
    Then I see the error message "Invalid email/password combination"
    
  