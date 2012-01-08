Feature:
  Adding more functionality to the Todo list

  Scenario: Complete yesterday's To-Do
    Given I have a To-Do list
    And that list has a To-Do that was due "yesterday"
    And I am on that list's page
    When I complete that item
    Then the item is completed
    And I am back on that list's page

  Scenario: Clean out all completed To-Do items from a list
    Given I have a To-Do list
    And that list has 3 To-Do items with no due date
    And that list has 4 To-Do items that are completed
    And I am on that list's page
    When I click clean up completed items
    Then I am back on that list's page
    And the completed items are gone