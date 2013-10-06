require 'spec_helper'

describe ProjectsController do

  before do
    @projects = Array.new
    30.times do |n|
      @projects.push (Project.create!(name: "Project"+n.to_s,
                      description: "Great projects"+n.to_s,
                      lifecycle_id: n % 4))
    end
  end

  describe "GET 'index'" do
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

  describe "GET 'show'" do
    before do
      @index = 0
      @numberOfPhases = 5
      @numberOfPhases.times do
        FactoryGirl.create(:project_phase, project: @projects[@index] , name: "TestProjectPhaseName")
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
      @testProject.lifecycle_string.should eq("Agile")
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
