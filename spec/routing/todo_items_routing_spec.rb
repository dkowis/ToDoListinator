require "spec_helper"

describe TodoItemsController do
  describe "nested todo_item entries within TodoList" do
    before do
      @todo_list_path = "/todo_lists/1"
    end
    it "displays nested todo_item entries" do
      get("#{@todo_list_path}/todo_items").should route_to("todo_items#index", todo_list_id: "1")
    end

    it "routes to #new" do
      get("#{@todo_list_path}/todo_items/new").should route_to("todo_items#new", todo_list_id: "1")
    end

    it "routes to #show" do
      get("#{@todo_list_path}/todo_items/1").should route_to("todo_items#show", todo_list_id: "1", :id => "1")
    end

    it "routes to #edit" do
      get("#{@todo_list_path}/todo_items/1/edit").should route_to("todo_items#edit", todo_list_id: "1", :id => "1")
    end

    it "routes to #create" do
      post("#{@todo_list_path}/todo_items").should route_to("todo_items#create", todo_list_id: "1")
    end

    it "routes to #update" do
      put("#{@todo_list_path}/todo_items/1").should route_to("todo_items#update", todo_list_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("#{@todo_list_path}/todo_items/1").should route_to("todo_items#destroy", todo_list_id: "1", :id => "1")
    end

    it "routes to #complete" do
      put("#{@todo_list_path}/todo_items/1/complete").should route_to("todo_items#complete", todo_list_id: "1", id: "1")
    end


  end
end
