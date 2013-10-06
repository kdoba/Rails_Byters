require 'spec_helper'


describe 'Project Overview' do

  before do
    @project = FactoryGirl.create(:project)
    @phases = Array.new
    5.times do
      @phases.push(FactoryGirl.create(:project_phase, project_id: @project.id, name: "TestProjectPhaseName"))
    end

    visit '/projects/' + @project.id.to_s
  end

  it "should have a title called Project Overview" do
    expect(page).to have_title('Project Overview')
  end

  it "should have labels for name, description, and lifecycle" do
    @label_names = ['Name', 'Description', 'Lifecycle', 'Total Estimation']
    page.all('.project_field_label').each_with_index { |element, index|
      element.should have_content(@label_names[index])
    }
  end

  it "should have input fields for project name, description, and lifecycle " do
    expect(page).to have_selector('input#name')
    expect(page).to have_selector('input#description')
    expect(page).to have_selector('input[id=lifecycle][disabled]')
  end

  it "should have a label and input field for total estimation " do
    expect(page).to have_selector('input[id=total_estimation][disabled]')
  end

  it "should have buttons for Save, Cancel, and Delete actions " do
    expect(page).to have_button('Submit')
    expect(page).to have_button('Back')
    expect(page).to have_button('Delete')
  end

  it "should have input fields with correct values of the selected project" do
    page.find('input#name').has_text? "First Project"
    page.find('input#description').has_text? "Yohoho"
    page.find('input#lifecycle').has_text? "Agile"
  end

  it "should have a table of project phases" do
    expect(page).to have_table('phase_table')
  end

  it "phase table should have headers called Name and Estimates" do
    expect(page.find('#phase_table thead tr')).to have_content("Name")
    expect(page.find('#phase_table thead tr')).to have_content("Estimates")
  end

  it "should have correct phase name and estimates in the phase table" do
    @phases.each_with_index do |phase, index|
      expect(page.find('#phase_table tbody tr#row_'+index.to_s+' td.name')).to have_content("TestProjectPhaseName")
      expect(page.find('#phase_table tbody tr#row_'+index.to_s+' td.estimates')).to have_content(100)
    end
  end

end
