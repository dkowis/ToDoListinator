require 'spec_helper'

describe TodoItem do
  it "should belong to a TodoList" do
    association = TodoItem.reflect_on_association(:todo_list)
    association.macro.should == :belongs_to
  end

  it "requires an entry" do
    item = TodoItem.new
    item.should_not be_valid

    item.entry = "blargag"
    item.should be_valid
  end
end
