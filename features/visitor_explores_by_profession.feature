Feature: Visitor explores roles by profession
  As a visitor looking to explore specific roles
  I want to be browse roles by profession
  So that I see professions break down

  Background:

    Given I am on the homepage

  Scenario: Views a role via profession
    When I follow the link "Explore by profession"
    Then I should be on the professions page
    When I click a profession
    Then I should be on the roles page
    When I click a role
    Then I should be on the role page
