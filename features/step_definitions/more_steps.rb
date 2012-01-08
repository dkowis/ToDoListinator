Given /^I have a To\-Do list$/ do
  @todo_list = TodoList.create!(:title => "testinating")
end

Given /^that list has a To\-Do that was due "([^"]*)"$/ do |date_due|
  due = parse_date date_due

  @todo_item = @todo_list.todo_items.build(:entry => "NYAN", :due_date => due)
  @todo_item.save!(:validate => false)
end

When /^I complete that item$/ do
  find(:xpath, "//section[@id='todo_list']/article/ol/li/a[@id='complete_#{@todo_item.id}']").click
end

Then /^the item is completed$/ do
  item = TodoItem.find_by_id @todo_item.id

  item.complete.should be_true
end
