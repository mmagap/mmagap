require "spec_helper"

describe LessonCheckoutsController do
  describe "routing" do

    it "routes to #index" do
      get("/lesson_checkouts").should route_to("lesson_checkouts#index")
    end

    it "routes to #new" do
      get("/lesson_checkouts/new").should route_to("lesson_checkouts#new")
    end

    it "routes to #show" do
      get("/lesson_checkouts/1").should route_to("lesson_checkouts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lesson_checkouts/1/edit").should route_to("lesson_checkouts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lesson_checkouts").should route_to("lesson_checkouts#create")
    end

    it "routes to #update" do
      put("/lesson_checkouts/1").should route_to("lesson_checkouts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lesson_checkouts/1").should route_to("lesson_checkouts#destroy", :id => "1")
    end

  end
end
