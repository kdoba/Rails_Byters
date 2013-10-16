require 'spec_helper'

describe Project do
  describe "Project model validation tests" do
    it "model has field name and description" do
      should respond_to :name
      should respond_to :description
    end

    it "should not have an empty name or empty lifecycle_id" do
      #Project.new(:name => "a valid project", :lifecycle_id => "").should_not be_valid
      project = Project.new(name: nil, lifecycle_id: nil)
      project.valid?
      project.errors.should have_key(:name)
      project.errors.should have_key(:lifecycle_id)
    end

    it "should not allow projects with duplicate names" do
      Project.create!(:name => "test1", :lifecycle_id => 1)
      duplicate_project = Project.new(:name => "test1", :lifecycle_id => 1)
      duplicate_project.should_not be_valid
    end
  end

  describe "Project model's association" do
    it "Project has many ProjectPhase" do
      should have_many :project_phases
    end

    it { should belong_to :lifecycle}
  end

  describe "creating new project with lifecycle_id" do
    before do
      @lifecycle_id = 1
      @newProject = Project.create(:name => "Potato",
                                  :description =>"Tomato Project",
                                  :lifecycle_id => @lifecycle_id)

      @lifecyclePhases = LifecyclePhase.find_all_by_lifecycle_id(@lifecycle_id)
      @projectPhases = ProjectPhase.find_all_by_project_id(@newProject.id)
    end

    it "creates the same number of project phases as lifecycle phases for the chosen lifecycle" do
      @projectPhases.count.should eq @lifecyclePhases.count
    end

    it "creates corresponding project phases for a given lifecycle" do
      @lifecyclePhases.each_with_index do |lifecyclePhase, index|
        lifecyclePhase.id.should eq @projectPhases[index].lifecycle_phase_id
      end
    end
  end
end
