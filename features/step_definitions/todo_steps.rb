Given /^I am on the main page$/ do
  visit('/')
end

When /^I click the create new list link$/ do
  click_link('New To-Do List')
end

Then /^I am on the create new list page$/ do
  page.should have_content "Create New To-Do List"
end

When /^I fill in a list name$/ do
  @list_title = "Sample List Title"
  fill_in 'Title', :with => @list_title
end

When /^I click submit$/ do
  click_button "Create To-Do List"
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

When /^I click on add a new To-Do$/ do
  click_link "Add a new To-Do"
end

Then /^I am on the new To-Do page$/ do
  xpath = "//article/header/h1"
  page.should have_xpath xpath
  page.find(:xpath, xpath).text.should == "Create a new To-Do for list: #{@list_title}"
end

When /^I enter a title with "([^"]*)"$/ do |entry|
  @todo_item_entry = entry
  fill_in "todo_item_entry", :with => entry
end

When /^the due date is blank$/ do
  page.find(:xpath, "//*[@id='due_date']").text.should be_empty
end

When /^I click Add$/ do
  click_button 'Create To-Do Item'
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

Then /^a To-Do Item exists with the title "([^"]*)"$/ do |arg1|
  page.should have_content arg1
end

When /^I enter a due date of "([^"]*)"$/ do |date_string|
  due = parse_date date_string

  fill_in 'due_date', :with => due.strftime("%m/%d/%Y")
end

Then /^that item has a due date of "([^"]*)"$/ do |date_string|
  due = parse_date date_string

  #To-Do should make this check contextually
  page.should have_content due.strftime("%Y-%m-%d")
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

When /^I select that a due date is required$/ do
  check 'date_required'
end

Given /^an existing list with (\d+) To-Do items$/ do |count|
  @todo_list = TodoList.create!(:title => "existing list with items")

  @items = []

  count.to_i.times do |x|
    item = @todo_list.todo_items.build(entry: "Entry #{x}")
    item.save!
    @items << item
  end
end

Given /^I am on that list's page$/ do
  visit todo_list_path @todo_list
end

When /^I click on the complete link for the second item$/ do
  find(:xpath, "//section[@id='todo_list']/article/ol/li/a[@id='complete_#{@items[1].id}']").click
end

Then /^that item is marked complete$/ do
  item = TodoItem.find_by_id @items[1].id
  item.complete.should == true
end


Then /^I am back on that list's page$/ do
  current_path.should == todo_list_path(@todo_list)
end