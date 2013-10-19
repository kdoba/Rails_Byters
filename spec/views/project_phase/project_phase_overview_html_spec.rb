require 'spec_helper'

describe 'Project Phase Overview' do
  before do
    @project = FactoryGirl.create(:project)
    @project_phase = ProjectPhase.find_all_by_project_id(@project.id).first
    @project_phase_deliverables = []
    2.times do
      @project_phase_deliverables.append(FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id))
    end
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
    @project_phase_deliverables.each_with_index do |deliverable, index|
      within subject.find('#deliverable_table tbody tr#row_' + (index + 1).to_s) do
        find('td.name').should have_content(deliverable.name)
        find('td.type').should have_content(deliverable.deliverable_type_id)
        find('td.complexity').should have_content(deliverable.complexity_id)
        find('td.size').should have_content(deliverable.size)
        find('td.unit').should have_content(deliverable.uom_id)

        #find('#deliverable_table tbody tr#row_1 td.name').should have_content(@project_phase_deliverable.name)
      end
    end

    # links
    should have_link('New Deliverable')
    should have_link('Back')

  end

  it "when click on back button, redirect to project overview page" do
    click_link('Back')
    current_path.should eq "/projects/1"
  end

  it "when click on new deliverable button, redirect to new project deliverable page with correct param project_phase_id" do
    click_link('New Deliverable')
    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should eq new_project_phase_deliverable_path(:project_phase_id => @project_phase.id.to_s)
  end
end
