require 'spec_helper'

describe 'Project Phase Overview' do
  before do
    @project_phase = FactoryGirl.create(:project_phase, :lifecycle_phase_id => 1, :project_id => 1)
    @project_phase_deliverable = FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id)
    #@project_phase = mock_model(ProjectPhase, :id => 1, :project_id => 1, :lifecycle_phase_id => 1)
    visit '/project_phases/' + @project_phase.id.to_s
  end

  subject { page }

  context "testing the view elements" do
    it { should have_title('Phase Summary') }
    it "should have a header called [project_name - project_phase_name] Summary" do
      subject.find('#page_header').should have_content(@project_phase.name + " Summary")
    end

    it "should have a label for the name of the project phase" do
      subject.find('label#deliverables').should have_content("Deliverables")
    end

    it { should have_table('deliverable_table') }

    it "phase table should have headers called Name, Type, Complexity, Size, Unit" do

      @column_names = ["Name", "Type", "Complexity", "Size", "Unit"]
      within subject.find('#deliverable_table thead tr') do
        @column_names.each do |column_name|
          should have_content(column_name)
        end
      end
    end

    it "table row content should be the same as the content of the project phase deliverable" do
      within subject.find('#deliverable_table tbody tr#row_1') do
        find('td.name').should have_content(@project_phase_deliverable.name)
        find('td.type').should have_content(@project_phase_deliverable.deliverable_type_id)
        find('td.complexity').should have_content(@project_phase_deliverable.complexity_id)
        find('td.size').should have_content(@project_phase_deliverable.size)
        find('td.unit').should have_content(@project_phase_deliverable.uom_id)

        #find('#deliverable_table tbody tr#row_1 td.name').should have_content(@project_phase_deliverable.name)
      end

    end

    it { should have_link('New Deliverable') }
    it { should have_link('Back') }
  end
end
