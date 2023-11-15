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
    When I click "UNI: user12345"
    Then I should see "User Profile"
    When I click "Back to Welcome Page"
    Then I should be on the welcome page
    When I click "UNI: user12345"
    Then I should see "User Profile" 
    When I click "Edit User Profile"
    Then I should see "Edit User Profile"
    And I fill in "Name" with "Abby"
    And I select "Woman" from "Gender"
    And I select "ENFP" from "MBTI"
    When I press "Save Changes"
    Then I should see "Abby"
    Then I should see "woman"
    Then I should see "enfp"
    When I click "Edit User Profile"
    When I click "Cancel"
    Then I should see "User Profile"
    When I click "Back to Welcome Page"
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