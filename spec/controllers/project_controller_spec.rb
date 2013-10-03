require 'spec_helper'

describe ProjectsController do

  before do
    30.times do |n|
      Project.create!(name: "Project"+n.to_s,
                      description: "Great projects"+n.to_s,
                      lifecycle_id: n % 4)
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
      get "show", {:id => @index+1}
      @testProject = assigns(:project)
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

  end

end
