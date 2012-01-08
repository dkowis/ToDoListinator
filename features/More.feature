Feature:
  Adding more functionality to the Todo list

  Scenario: Complete yesterday's To-Do
    Given I have a To-Do list
    And that list has a To-Do that was due "yesterday"
    And I am on that list's page
    When I complete that item
    Then the item is completed
    And I am back on that list's page