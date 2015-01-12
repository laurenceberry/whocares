Feature: Visitor explores roles by jobs
  As a visitor looking to explore roles by jobs
  I want to be browse roles by jobs
  So that I see who does a specific task

  Background:

    Given I am on the homepage

  Scenario: Views a role via jobs
    When I follow the link "Who does what jobs"
    Then I should be on the jobs page
    When I click a job
    Then I should be on the job page
    When I click a role
    Then I should be on the role page
    And I should see a link to the job
