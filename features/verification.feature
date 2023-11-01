#Feature: Verification
#	Scenario: Valid verification_code
#
#    	Given I visit the verification page
#		And I put down "Verification Code" with "valid"
#		And I move by clicking "Verify"
#		Then I should see a sentence "Log in"
#	
#	Scenario: Invalid verification_code
#		Given I visit the verification page
#		And I put down "Verification Code" with "invalid"
#		And I move by clicking "Verify"
#		Then I should see flash error message "Invalid verification code. Please try again."
#
#	Scenario: Empty verification_code
#		Given I visit the verification page
#		And I put down "Verification Code" with ""
#		And I move by clicking "Verify"
#		Then I should see flash error message "Invalid verification code. Please try again."