Feature: User Registration
  As a courier user
  Such that I go to Registration page
  I want to register as a courier user

Scenario: Courier User Registraion (with confirmation)
    Given I am on the courier Registraion page
    And I enter Name "Robert", surname "Downey", username "rdj01", Date of birth "1995-09-28", Email "rdj01@gmail.com" and  Password "robertdowneyjr" 
    When I submit the form 
    Then I should receive a confirmation message "Courier was updated successfully"