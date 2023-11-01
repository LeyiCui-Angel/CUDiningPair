Feature: User Login

  Scenario: User login valid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "ab123"
    And I click on button "Login"
	  Then I should be on the welcome page

  Scenario: User login with invalid details
    Given I visit the login page
    When I type in "UNI" with "ab123"
    And I type in "Password" with "123"
    And I click on button "Login"
    Then I should see flash message "Invalid UNI/password combination"
    
  