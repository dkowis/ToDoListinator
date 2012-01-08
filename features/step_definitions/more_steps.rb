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

Given /^that list has (\d+) To\-Do items with no due date$/ do |count|
  @items ||= Array.new

  count.to_i.times do |x|
    item = @todo_list.todo_items.build(:entry => "entry #{x}")
    item.save!
    @items << item
  end
end

Given /^that list has (\d+) To\-Do items that are completed$/ do |count|
  @items ||= Array.new

  count.to_i.times do |x|
    item = @todo_list.todo_items.build(:entry => "complete entry #{x}", :complete => true)
    item.save!
    @items << item
  end
end

When /^I click clean up completed items$/ do
  #/html/body/div/section/article/footer/a[3]
  click_link "Clean Up"
end

Then /^the completed items are gone$/ do
  @items.each do |item|
    if item.complete
      page.should_not have_content item.entry
    end
  end
end
