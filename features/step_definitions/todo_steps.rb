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
  page.should have_xpath "//section[@id='todo_list']/article/header/h1/text()"

  find(:xpath, "//section[@id='todo_list']/article/header/h1/text()").text.should == @list_title
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
  xpath = "//article/header/h1"
  page.should have_xpath xpath
  page.find(:xpath, xpath).text.should == "Create a new Todo for list: #{@list_title}"
end

When /^I enter a title with "([^"]*)"$/ do |entry|
  @todo_item_entry = entry
  fill_in "todo_item_entry", :with => entry
end

When /^the due date is blank$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click Add$/ do
  click_button 'Create Todo Item'
end

Then /^it was added successfully$/ do
  item_relation = TodoItem.where(:entry => @todo_item_entry).joins(:todo_list).merge(TodoList.where(:title => @list_title))

  item_relation.count.should == 1
  item = item_relation.first
  item.should_not be_nil
  @todo_item = item
end

Then /^I am on the existing list page$/ do
  step %q{I'm on the page for my list}
end

Then /^a Todo Item exists with the title "([^"]*)"$/ do |arg1|
  page.should have_content arg1
end

When /^I enter a due date of "([^"]*)"$/ do |date_string|
  due = parse_date date_string

  select(due.year.to_s, :from => "todo_item[due_date(1i)]")
  select(due.strftime("%B"), :from => "todo_item[due_date(2i)]")
  select(due.day.to_s, :from => "todo_item[due_date(3i)]")

end

Then /^that item has a due date of "([^"]*)"$/ do |date_string|
  due = parse_date date_string

  #TODO should make this check contextually
  page.should have_content due.strftime("%y-%m-%d")
end
When /^the due date is not required$/ do
  uncheck 'date_required'
end

def parse_date(date_string)
  if date_string == "tomorrow"
    1.day.from_now
  else
    Date.parse(due_date)
  end
end

When /^the due_date should be nil$/ do
  @todo_item.due_date.should be_nil
end