require 'spec_helper'

describe ProjectPhase do
  describe "ProjectPhase model validation tests" do
    it "model has fields lifecycle phase id and project id" do
      should respond_to :lifecycle_phase_id
      should respond_to :project_id
    end
  end

  describe "ProjectPhase model's association" do
    it "ProjectPhase belongs to Project" do
      should belong_to :project
    end
  end

  describe "ProjectPhase model has a valid name" do
    it "should respond to a name field" do
      should respond_to :name
    end

    it "should not have a name field that is null" do
      ProjectPhase.new(:name => "").should_not be_valid
    end
  end
end
