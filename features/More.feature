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

  Scenario: To-Do lists are sorted with due items first
    Given I have a To-Do list
    And that list has 4 To-Do items with no due date
    And I am on that list's page
    When I click on add a new To-Do
    And I enter a title with "due date!"
    And I enter a due date of "today"
    And I click Add
    Then I am back on that list's page
    And the todo with a due date is at the top of the list

  Scenario: To-Do lists are sorted with most recently due items first
    Given I have a To-Do list
    And that list has 4 To-Do items with no due date
    And I am on that list's page
    When I create To-Do items:
      | due_date  | entry                             |
      | 1/11/2222 | this one is due in like 200 years |
      | tomorrow  | this one is due tomorrow          |
      | today     | this one is due today             |
    Then I am back on that list's page
    And the todo with the entry "this one is due today" is the first