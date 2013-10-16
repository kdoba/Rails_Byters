require 'spec_helper'

describe ProjectPhasesController do

  before do
     Project.create!(name: "Project1", description: "Great project", lifecycle_id: 1)
  end

  context "GET 'show'" do

    before do
      @index = 1
      get "show", {:id => @index}
      @testPhase = assigns(:project_phase)
    end

    it "returns http success" do
      response.should be_success
    end

    it "renders the show template" do
      response.should render_template("show")
    end

    it "should have a project phase" do
      @testPhase.should_not be_nil
    end
  end

end