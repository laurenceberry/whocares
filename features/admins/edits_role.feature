Feature: Contributor edits role
  As a contributor
  I want to edit a role
  So that I can improve the content

  Background:
    Given I am a contributor
    And I have signed in

  @wip
  Scenario: Views a role via profession
    When I follow the link "Explore by profession"
    Then I should be on the professions page
    When I click a profession
    Then I should be on the roles page
    When I click a role
    Then I should be on the role page
