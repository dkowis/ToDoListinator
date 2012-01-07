require 'spec_helper'

describe "todo_lists/new" do
  before(:each) do
    assign(:todo_list, stub_model(TodoList,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new todo_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todo_lists_path, :method => "post" do
      assert_select "input#todo_list_title", :name => "todo_list[title]"
    end
  end
end
