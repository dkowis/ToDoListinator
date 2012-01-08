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

  describe "a list of todo_items" do
    it "are sorted by due_date, with items without a due date at the end" do
      items = Array.new

      undated_items = Array.new
      3.times do |x|
        item = TodoItem.new(:entry => "Undated Entry #{x}")
        item.id = x
        items << item
        undated_items << item
      end

      dated_items = Array.new
      5.times do |x|
        item = TodoItem.new(:entry => "Dated entry #{x}")
        item.id = x+10
        item.due_date = x.days.from_now
        items << item
        dated_items << item
      end

      items.sort!

      items.size.times do |x|
        if x <5
          items[x].should == dated_items[x]
        else
          items[x].should == undated_items[x-5]
        end
      end


    end
  end
end
