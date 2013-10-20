require 'spec_helper'


describe 'Project Overview' do

  before do
    FactoryGirl.create(:project, :name => "Dummy", :lifecycle_id => 1)
    @project = FactoryGirl.create(:project, :name => "Dummy 2", :lifecycle_id => 2)
  end

  before :each do
    visit '/projects/' + @project.id.to_s
  end

  subject { page }

  it "should have all required view elements" do
    should have_title('Project Overview')
    find('#page_header').should have_content(@project.name + " Overview")

    #test label names
    @label_names = ['Name', 'Description', 'Lifecycle', 'Total Estimation']
    page.all('.project_field_label').each_with_index { |element, index|
      element.should have_content(@label_names[index])
    }

    #test input fields
    should have_selector('input#name')
    should have_selector('textarea#description')
    should have_selector('input[id=lifecycle][disabled]')
    should have_selector('input[id=total_estimation][disabled]')

    #test buttons
    should have_link('Save')
    should have_link('Back')
    should have_link('Delete')

    #test project content
    find('input#name').value.should eq "Dummy 2"
    find('textarea#description').should have_text "Yohoho"
    find('input#lifecycle').value.should eq "Spiral"

    #test project phase table
    should have_table('phase_table')

    within subject.find('#phase_table thead tr') do
      should have_content("Project Phases")
      should have_content("Estimates")
    end

    #test phases
    page.all('#phase_table tbody tr').count.should eq @project.project_phases.count

    lifecyclePhases = LifecyclePhase.find_all_by_lifecycle_id(@project.lifecycle_id)
    @project.project_phases.each_with_index do |phase, index|
      expect(page.find('#phase_table tbody tr#row_'+index.to_s+' td.name')).to have_content(lifecyclePhases[index].name)
      expect(page.find('#phase_table tbody tr#row_'+index.to_s+' td.estimates')).to have_content(100)
    end
  end

  it "should have a back button that redirects to project index page" do
    click_link('Back')
    current_path.should eq "/projects"
  end

  it "should have a link in the name column in Project Phase page" do
    page.find("#row_0").find("a").click
    current_path.should == "/project_phases/" + @project.project_phases.first.id.to_s
  end

end
