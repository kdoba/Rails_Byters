require 'spec_helper'

describe Project do
  describe "Project model validation tests" do
    it "model has field name and description" do
      should respond_to :name
      should respond_to :description
      should respond_to :lifecycle_string
    end
  end

  describe "Project model's association" do
    it "Project has many ProjectPhase" do
      should have_many :project_phases
    end
  end
end
