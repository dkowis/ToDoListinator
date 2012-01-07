require 'spec_helper'

describe TodoItem do

  before do
    @valid_item = TodoItem.new
    @valid_item.todo_list = TodoList.new(:title => "blarg")
    @valid_item.entry = "blarg"
  end

  it "should belong to a TodoList" do
    association = TodoItem.reflect_on_association(:todo_list)
    association.macro.should == :belongs_to
  end

  it "requires an entry" do
    @valid_item.entry = nil
    @valid_item.should_not be_valid

    @valid_item.entry = "blargag"
    @valid_item.should be_valid
  end

  it "requires a Todo List" do
    @valid_item.todo_list = nil
    @valid_item.should_not be_nil

    @valid_item.todo_list = TodoList.new(:title => "blarg")
    @valid_item.should be_valid
  end
end
