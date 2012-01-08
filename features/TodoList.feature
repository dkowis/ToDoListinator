Feature:
  Please provide a simple To-Do list Rails application as a code sample.
  The application should be all your own work but does not need to be complicated.
  Users of the application should be able to create lists that have a title and a collection of tasks.
  Each task should have a title, a status indicating whether it is complete and an optional due date.
  You have discretion in designing the UI and you may add any additional features you feel are useful.
  We would prefer to see fewer working features over many buggy features.

  Scenario: Create a todo list
    Given I am on the main page
    When I click the create new list link
    Then I am on the create new list page
    When I fill in a list name
    And I click submit
    Then my list is created
    And I'm on the page for my list

  Scenario: Add a todo item to a list without a due date
    Given I am on an existing list page
    When I click on add a new todo
    Then I am on the new todo page
    When I enter a title with "get stuff done"
    And the due date is not required
    And I click Add
    Then it was added successfully
    And the due_date should be nil
    And I am on the existing list page
    And a Todo Item exists with the title "get stuff done"

  Scenario: Add a todo item to a list with a due date
    Given I am on an existing list page
    When I click on add a new todo
    Then I am on the new todo page
    When I enter a title with "get stuff done now"
    And I enter a due date of "tomorrow"
    And I select that a due date is required
    And I click Add
    Then it was added successfully
    And I am on the existing list page
    And a Todo Item exists with the title "get stuff done now"
    And that item has a due date of "tomorrow"

