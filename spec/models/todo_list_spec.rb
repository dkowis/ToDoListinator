require 'spec_helper'

describe TodoList do
  it "has many todo items" do
    association = TodoList.reflect_on_association(:todo_items)
    association.macro.should == :has_many
  end

  it "requires a title" do
    todo_list = TodoList.new
    todo_list.should_not be_valid

    todo_list.title = "sample"
    todo_list.should be_valid
  end
end
