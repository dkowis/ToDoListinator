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

  it "can clean up completed items" do
    todo_list = TodoList.new(:title => "blarg")


    items = []
    10.times do |x|
      todo_item = mock_model(TodoItem).as_null_object

      todo_list.todo_items << todo_item
      items << todo_item
    end

    5.times do |x|
      todo_item = mock_model(TodoItem)

      todo_item.should_receive(:complete).and_return(false)

      todo_list.todo_items << todo_item
    end

    todo_list.todo_items.size.should == 15


    items.each do |item|
      item.should_receive(:complete).and_return(true)
      item.should_receive(:destroy)
    end

    todo_list.clean_up

  end
end
