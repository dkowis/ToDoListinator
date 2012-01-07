require 'spec_helper'

describe "todo_items/new" do
  before(:each) do
    assign(:todo_item, stub_model(TodoItem,
      :entry => "MyString",
      :todo_list_id => 1,
      :complete => false
    ).as_new_record)
  end

  it "renders new todo_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todo_items_path, :method => "post" do
      assert_select "input#todo_item_entry", :name => "todo_item[entry]"
      assert_select "input#todo_item_todo_list_id", :name => "todo_item[todo_list_id]"
      assert_select "input#todo_item_complete", :name => "todo_item[complete]"
    end
  end
end
