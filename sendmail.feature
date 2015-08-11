# See comments in steps file

Feature: As a valid user I should be able to log in to Gmail and mail myself stuff.
    
  Scenario: I log in under my username and the valid password
    Given I am at gmail
    And I enter "username" into the username field
    Then I click on element having id "next"
    And I wait 2 sec
    And I enter "password" into the password field
    Then I click on element having id "signIn"
    And I wait 10 sec
    Then I click the compose button
    And I wait 4 sec
    Then I type my own address in the recipient bar
    Then I type a subject
    Then I write my email
    Then I hit send
    And I wait 5 sec
    Then I reload my inbox
    And I wait 5 sec
    Then I click on the first email
    And I wait 5 sec
    Then I check to make sure I clicked the right email
    Then I close the browser