require 'spec_helper'

describe 'Project Phase Overview' do
  before :all do
    @project_phase = FactoryGirl.create(:project_phase, :lifecycle_phase_id => 1, :project_id => 1)
    @project_phase_deliverable = FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id)
    #@project_phase = mock_model(ProjectPhase, :id => 1, :project_id => 1, :lifecycle_phase_id => 1)
  end

  before :each do
    visit '/project_phases/' + @project_phase.id.to_s
  end

  subject { page }

  it "has all required view elements" do
    should have_title('Phase Summary')
    subject.find('#page_header').should have_content(@project_phase.name + " Summary")
    subject.find('label#deliverables').should have_content("Deliverables")

    # test table
    should have_table('deliverable_table')

    @column_names = ["Name", "Type", "Complexity", "Size", "Unit"]
    within subject.find('#deliverable_table thead tr') do
      @column_names.each do |column_name|
        should have_content(column_name)
      end
    end

    # table content
    within subject.find('#deliverable_table tbody tr#row_1') do
      find('td.name').should have_content(@project_phase_deliverable.name)
      find('td.type').should have_content(@project_phase_deliverable.deliverable_type_id)
      find('td.complexity').should have_content(@project_phase_deliverable.complexity_id)
      find('td.size').should have_content(@project_phase_deliverable.size)
      find('td.unit').should have_content(@project_phase_deliverable.uom_id)

      #find('#deliverable_table tbody tr#row_1 td.name').should have_content(@project_phase_deliverable.name)
    end

    # links
    should have_link('New Deliverable')
    should have_link('Back')

  end
end
