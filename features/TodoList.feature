Feature:
  Please provide a simple To-Do list Rails application as a code sample.
  The application should be all your own work but does not need to be complicated.
  Users of the application should be able to create lists that have a title and a collection of tasks.
  Each task should have a title, a status indicating whether it is complete and an optional due date.
  You have discretion in designing the UI and you may add any additional features you feel are useful.
  We would prefer to see fewer working features over many buggy features.

  Scenario: Create a To-Do list
    Given I am on the main page
    When I click the create new list link
    Then I am on the create new list page
    When I fill in a list name
    And I click submit
    Then my list is created
    And I'm on the page for my list

  Scenario: Add a To-Do item to a list without a due date
    Given I am on an existing list page
    When I click on add a new To-Do
    Then I am on the new To-Do page
    When I enter a title with "get stuff done"
    And the due date is blank
    And I click Add
    Then it was added successfully
    And the due_date should be nil
    And I am on the existing list page
    And a To-Do Item exists with the title "get stuff done"

  Scenario: Add a To-Do item to a list with a due date
    Given I am on an existing list page
    When I click on add a new To-Do
    Then I am on the new To-Do page
    When I enter a title with "get stuff done now"
    And I enter a due date of "tomorrow"
    And I click Add
    Then it was added successfully
    And I am on the existing list page
    And a To-Do Item exists with the title "get stuff done now"
    And that item has a due date of "tomorrow"

  Scenario: Complete a To-Do item
    Given an existing list with 3 To-Do items
    And I am on that list's page
    When I click on the complete link for item 2
    Then that item is marked complete
    And I am back on that list's page

  @wip
  Scenario: Edit a To-Do item
    Given an existing list with 3 To-Do items
    And I am on that list's page
    When I click on the edit link for the item 2
    Then I am on the edit item page for that item
    When I change the entry to "OMG FART"
    And I click "Update To-Do Item"
    Then I am on that list's page
    And I am notified that the To Do item has been updated
