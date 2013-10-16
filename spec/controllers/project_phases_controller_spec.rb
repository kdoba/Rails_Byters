require 'spec_helper'

describe ProjectPhasesController do
  #
  #describe 'get all project phases with project id' do
  #
  #  before do
  #    5.times do |index|
  #      project = FactoryGirl.create :project, :name => "name"+index.to_s
  #      4.times do |index|
  #        FactoryGirl.create(:project_phase, :lifecycle_phase_id => index, :project => project)
  #      end
  #    end
  #  end
  #
  #  it 'ensures getProjectPhases returns a non empty array given an existing project id' do
  #    projectPhaseArray = ProjectPhasesController.getProjectPhases 1
  #    projectPhaseArray.should be_a_kind_of Array
  #  end
  #
  #  it 'retrieves all project phases given a project id' do
  #    index = 1
  #    projectPhaseArray = ProjectPhasesController.getProjectPhases index
  #    projectPhaseArray.should_not be_empty
  #    projectPhaseArray.each do |projectPhase|
  #      projectPhase.should be_a ProjectPhase
  #      projectPhase.project_id.should eq index
  #    end
  #  end
  #
  #end
end