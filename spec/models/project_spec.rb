require 'spec_helper'

describe Project do
  describe "Project model validation tests" do
    it "model has field name and description" do
      should respond_to :name
      should respond_to :description
    end

    it "should not have name field that is empty" do
      Project.new(:name => "").should_not be_valid
    end

    it "should not allow projects with duplicate names" do
      Project.create!(:name => "test1")
      duplicate_project = Project.new(:name => "test1")
      duplicate_project.should_not be_valid
    end
  end

  describe "Project model's association" do
    it "Project has many ProjectPhase" do
      should have_many :project_phases
    end

    it { should belong_to :lifecycle}
  end
end
