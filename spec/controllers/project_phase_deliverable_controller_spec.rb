require 'spec_helper'

describe ProjectPhaseDeliverableController do
  before do
    @project = FactoryGirl.create(:project)
    @project_phase = ProjectPhase.find_all_by_project_id(@project.id).first
  end

  context "GET 'show'" do
    before do
      FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id)
      @index = 1
      get "show", {:id => @index}
      @deliverable = assigns(:project_phase_deliverable)
    end

    it "returns http success" do
      response.should be_success
    end

    it "renders the show template" do
      response.should render_template("show")
    end

    it "should have a project phase deliverable" do
      @deliverable.should_not be_nil
    end
  end
end
