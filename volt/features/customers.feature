Feature: User Registration
  As a customer user
  Such that I go to Registration page
  I want to register as a customer User

Scenario: Customer User Registraion (with confirmation)
    Given I am on the customer Registraion page
    And I enter Name "Chris",Surname "Ron",Date of birth "1989-05-25",Address "Narva",Card number "123456" and Email "ron777@gmail.com"
    When I submit the form 
    Then I should receive a confirmation message "Customer updated successfully"