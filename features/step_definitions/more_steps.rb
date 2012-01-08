Given /^I have a To\-Do list$/ do
  @todo_list = TodoList.create!(:title => "testinating")
end

Given /^that list has a To\-Do that was due "([^"]*)"$/ do |date_due|
  due = parse_date date_due

end

When /^I complete that item$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the item is completed$/ do
  pending # express the regexp above with the code you wish you had
end
