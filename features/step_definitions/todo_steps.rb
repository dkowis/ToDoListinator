Given /^I am on the main page$/ do
  visit('/')
end

When /^I click the create new list link$/ do
  click_link('New Todo List')
end

Then /^I am on the create new list page$/ do
  page.should have_content "Create New Todo List"
end

When /^I fill in a list name$/ do
  @list_title = "Sample List Title"
  fill_in 'Title', :with => @list_title
end

When /^I click submit$/ do
  click_button "Create Todo List"
end

Then /^my list is created$/ do
  TodoList.find_by_title(@list_title).should_not be_nil
end

Then /^I'm on the page for my list$/ do
  page.should have_content "Title:"
  page.should have_content @list_title
end

Given /^I am on an existing list page$/ do
  @list_title = "Existing list of testness"
  @todo_list = TodoList.create(title: @list_title)
  visit("/todo_lists/#{@todo_list.id}")
  step %q{I'm on the page for my list}
end

When /^I click on add a new todo$/ do
  click_link "Add a new Todo"
end

Then /^I am on the new todo page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I enter a title with "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^the due date is blank$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click Add$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it was added successfully$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am on the existing list page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^a Todo Item exists with the title "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I enter a due date of "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^that item has a due date of "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
