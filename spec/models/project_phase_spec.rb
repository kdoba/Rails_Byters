require 'spec_helper'

describe ProjectPhase do
  describe "ProjectPhase model validation tests" do

    #before do
    #  @lifecycle_phase_names = ["Requirements", "Design", "Implementation", "Verification", "Maintenance"]
    #end

    it "model has fields lifecycle phase id and project id" do
      should respond_to :lifecycle_phase_id
      should respond_to :project_id
    end

    it "should respond to name" do
      should respond_to :name
    end

    it "should not have any fields that is null" do
      ProjectPhase.new(:lifecycle_phase_id => "").should_not be_valid
      ProjectPhase.new(:project_id => "").should_not be_valid
    end

    it "should return the correct name corresponding to the lifecycle_phase_id" do
      phase_index = 1
      projectPhase = ProjectPhase.new(:lifecycle_phase_id => phase_index, :project_id => 0)
      projectPhase.name.should eq LifecyclePhase.find(phase_index).name
    end
  end

  describe "ProjectPhase model's association" do

    it "should belongs to Project" do
      should belong_to :project
    end

    it "should belong to lifecycle phase" do
      should belong_to :lifecycle_phase
    end

    it "should have many project phase deliverables" do
      should have_many :project_phase_deliverables
    end

  end

end
