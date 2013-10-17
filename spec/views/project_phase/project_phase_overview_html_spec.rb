require 'spec_helper'

describe 'Project Phase Overview' do
  before do
    @project_phase = FactoryGirl.create(:project_phase, :lifecycle_phase_id => 1, :project_id => 1)
    visit '/project_phases/' + @project_phase.id.to_s
  end

  subject { page }

  context "testing the view elements" do
    it { should have_title('Phase Summary') }
    it "should have a header called [project_phase_name] Summary" do
      subject.find('#page_header').should have_content(@project_phase.name + " Summary")
    end

    it "should have a label for the name of the project phase" do
      subject.find('label#deliverables').should have_content("Deliverables")
    end

    it { should have_table('deliverable_table') }

    it { should have_link('New Deliverable') }
    it { should have_link('Back') }
  end
end
