Feature: Visitor explores roles by condition
  As a visitor looking to explore roles by conditions
  I want to be browse roles by condition
  So that I see who is involved in the care for a condition

  Background:

    Given I am on the homepage

  Scenario: Views a role via condition
    When I follow the link "Search by condition"
    Then I should be on the conditions page
    When I click a condition
    Then I should be on the condition page
    When I click a role
    Then I should be on the role page
