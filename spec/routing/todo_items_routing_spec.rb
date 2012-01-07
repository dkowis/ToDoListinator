require "spec_helper"

describe TodoItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/todo_items").should route_to("todo_items#index")
    end

    it "routes to #new" do
      get("/todo_items/new").should route_to("todo_items#new")
    end

    it "routes to #show" do
      get("/todo_items/1").should route_to("todo_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/todo_items/1/edit").should route_to("todo_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/todo_items").should route_to("todo_items#create")
    end

    it "routes to #update" do
      put("/todo_items/1").should route_to("todo_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/todo_items/1").should route_to("todo_items#destroy", :id => "1")
    end

  end
end
