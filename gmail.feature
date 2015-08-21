Feature: As a valid user I should be able to log in to Gmail.
    
  Scenario: I log in under my username and the valid password
    Given I am at gmail
    And I enter "username" into the username field
    Then I click on element having id "next"
    And I wait 2 sec
    And I enter "password" into the password field
    Then I click on element having id "signIn"
    And I wait 10 sec
    Then I click on the first email
    And I wait 10 sec
    Then I close the browser