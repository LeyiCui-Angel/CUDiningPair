Feature: User Login

  Scenario: User login valid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "123"
    And I click "Login"
	Then I should see heading "Welcome to CUDiningPair"
	And I click "Log Out"
	Then I should be in the login page

  Scenario: User login with invalid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "123"
    And I click "Login"
	Then I should not see heading "Welcome to CUDiningPair"
    
  