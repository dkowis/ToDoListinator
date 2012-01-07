require 'spec_helper'

describe "todo_items/show" do
  before(:each) do
    @todo_item = assign(:todo_item, stub_model(TodoItem,
      :entry => "Entry",
      :todo_list_id => 1,
      :complete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Entry/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
