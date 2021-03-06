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
      @deliverable  = assigns(:deliverable)
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

  context "GET 'new'" do
    it "should redirect to the home page with the error message if project phase id is not specified" do
      get 'new'
      response.should redirect_to "/projects"
      flash[:alert].should_not be_empty
    end

    it "returns http success" do
      get "new", {:project_phase_id => 1}
      response.should be_success
    end
  end

  context "create new project phase deliverable" do

    it "there should be a function called 'create'" do
      should respond_to :create
    end

    context "Successfully create a new project deliverable" do
      before do
        @projectPhaseId = 1
        post "create", {:project_phase_deliverable => {
            :name => "Deliverable 1",
            :description =>"Tomato Project",
            :uom_id => 1,
            :project_phase_id => @projectPhaseId,
            :size => 1,
            :rate => 1.0,
            :effort => 1.0,
            :complexity_id => 1,
            :deliverable_type_id => 1}}

        @new_deliverable = assigns(:deliverable)
      end

      it "should redirect to project phase overview page" do
        response.should redirect_to "/project_phases/" + @projectPhaseId.to_s
      end

      it "should persist the project deliverable" do
        @new_deliverable.should be_persisted
      end

      it "should print success message" do
        flash[:success].should_not be_empty
      end
    end
  end

  context "Unsuccessfully create a new deliverable" do
    #TODO: make this more detailed error message!!!
    it "should render new template with error message" do
      post "create", {:project_phase_deliverable => {:description =>"Tomato deliverable", :project_phase_id=> @project_phase.id}}
      @deliverable = assigns(:deliverable)
      response.should render_template("new")
      flash[:alert].should_not be_nil
      flash[:alert].should_not be_empty
    end

    it "should redirect to the home page with an error message if project_phase_id missing" do
      post "create", {:project_phase_deliverable => {:description =>"Tomato deliverable"}}
      response.should redirect_to "/projects"
      flash[:alert].should_not be_empty
    end
  end
end

