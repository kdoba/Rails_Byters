require 'spec_helper'

describe ProjectsController do

  context "Display information" do

    before do
      @projects = Array.new
      30.times do |n|
        @projects.push (Project.create!(name: "Project"+n.to_s,
                        description: "Great projects"+n.to_s,
                        lifecycle_id: n % Lifecycle.count + 1))
      end
    end

    context "GET 'index'" do
      before do
        get 'index'
        @testProjects = assigns(:projects)
      end

      it "returns http success" do
        response.should be_success
      end

      it "renders the index template" do
        response.should render_template("index")
      end

      it "checks to see if the projects variable is an instance of the Project class" do
        @testProjects.should eq(Project.all)
      end

      it "can ensures the name from a Project is not empty" do
        @testProjects.each do |project|
          project.name.should_not be_empty
        end
      end
    end

    context "GET 'show'" do
      before do
        @index = 0
        @numberOfPhases = 5
        @numberOfPhases.times do |n|
          FactoryGirl.create(:project_phase, project: @projects[@index], lifecycle_phase_id: n+1)
        end

        get "show", {:id => @index+1}
        @testProject = assigns(:project)
        @testProjectPhases = assigns(:project_phases)
      end
      it "returns http success" do
        response.should be_success
      end

      it "renders the show template" do
        response.should render_template("show")
      end

      it "show has access to project field variables" do
        @testProject.name.should eq("Project"+@index.to_s)
        @testProject.description.should eq("Great projects"+@index.to_s)
        @testProject.lifecycle.name.should eq (Lifecycle.find(@index + 1).name) #_string.should eq("Agile")
      end

      it "has testsProjectPhases that is not nil" do
        @testProjectPhases.should_not be_nil
      end

      it "has testProjectPhases which is a non-empty array" do
        @testProjectPhases.should_not be_empty
      end

      it "has to retrieves the correct number of project phases" do
        @testProjectPhases.count.should eq @numberOfPhases
      end

      it "retrieves all the project phases that belong to the project" do
        @testProjectPhases.each do |projectPhase|
          projectPhase.project_id.should == @testProject.id
        end
      end
    end

  end

  context "create new project entry" do

    it "there should be a function called 'create'" do
      should respond_to :create
    end

    context "Successfully create a new project" do
      before do
        post "create", {:project => {:name => "Potato", :description =>"Tomato Project"}}
        @newProject = assigns(:new_project)
      end

      it "should support POST request with params" do
        @newProject.should be_a(Project)
      end

      it "should save the new Project" do
        @newProject.should be_persisted
      end

      it "should redirect to a project overview page after creating a project" do
        response.should redirect_to("/projects/"+@newProject.id.to_s)
        #response.should render_template("show")
      end

      it "should have a flash message" do
        flash[:success].should_not be_empty
      end
    end

    context "Unsuccessfully create a new project" do
      before do
        post "create", {:project => {:description =>"Tomato Project"}}
        @newProject = assigns(:new_project)
      end

      #TODO: make this more detailed error message!!!
      it "should have a error flash message" do
        flash[:alert].should_not be_empty
      end
    end
  end

  context "GET 'new'" do
    before do
      get 'new'
    end

    it "returns http success" do
      response.should be_success
    end
  end

end
