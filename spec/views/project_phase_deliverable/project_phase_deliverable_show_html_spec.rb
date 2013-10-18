require 'spec_helper'

describe 'Project Phase Deliverable Show page' do
  before do
    @project = FactoryGirl.create(:project)
    @project_phase = ProjectPhase.find_all_by_project_id(@project.id).first
    @project_phase_deliverable = FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id)

    visit '/project_phase_deliverable/' + @project_phase_deliverable.id.to_s
  end

  subject { page }

  it "has all required view elements" do
    should have_title("Edit Deliverable")
    subject.find('#page_header').should have_content("Edit " + @project_phase_deliverable.name)
  end
end