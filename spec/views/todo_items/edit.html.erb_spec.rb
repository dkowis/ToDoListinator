require 'spec_helper'

describe "todo_items/edit" do
  before(:each) do
    @todo_item = assign(:todo_item, stub_model(TodoItem,
      :entry => "MyString",
      :todo_list_id => 1,
      :complete => false
    ))
  end

  it "renders the edit todo_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todo_items_path(@todo_item), :method => "post" do
      assert_select "input#todo_item_entry", :name => "todo_item[entry]"
      assert_select "input#todo_item_todo_list_id", :name => "todo_item[todo_list_id]"
      assert_select "input#todo_item_complete", :name => "todo_item[complete]"
    end
  end
end
