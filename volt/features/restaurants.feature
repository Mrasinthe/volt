Feature: User Registration
  As a restaurant user
  Such that I go to Registration page
  I want to register as a Restaurant User

Scenario: Restaurant User Registraion (with confirmation)
    Given I am on the Restaurant Registraion page
    And I enter username "Mac01", Rname "MacDonalds" , Email "mac01@gmail.com", Address "Tartu" , Password "macdonalds" and Tag "fastfood"
    When I submit the form 
    Then I should receive a confirmation message "Restaurant updated successfully"