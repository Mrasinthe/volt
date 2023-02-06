Feature: Adding Items
  As a restaurant user
  Such that I go to item page
  I want to add items

Scenario: Add Item successfully (with confirmation)
    Given I am on the add items page
    And I click on the New Item
    And I enter name "MacBurger", description "MacBurger", price "2.50" and status "Available"
    When I submit the form 
    Then I should receive a confirmation message "item created successfully"