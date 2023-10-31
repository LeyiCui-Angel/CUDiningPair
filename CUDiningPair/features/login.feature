Feature: User Login

  Scenario: User login valid details
    Given I visit the login page
    When I type in "UNI" with "hk3060"
    And I type in "Password" with "12"
    And I click "Login"
	  Then I should visit welcome page

  Scenario: User login with invalid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "123"
    And I click "Login"
    Then I see the error message "Invalid email/password combination"
    
  