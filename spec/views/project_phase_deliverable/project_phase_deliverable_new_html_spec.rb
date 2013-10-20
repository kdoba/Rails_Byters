require 'spec_helper'

describe "New Project Phase Deliverable" do
  before do
    @project_phase = FactoryGirl.create(:project_phase)
    visit new_project_phase_deliverable_path(project_phase_id: @project_phase.id)
  end

  subject { page }

  it "should have all required view elements" do
    should have_title('Create New Deliverable')
    find('#page_header').text.should eq('Create New Deliverable')

    should have_selector('fieldset')

    #test form labels
    @label_names = ['Name', 'Description', 'Type', 'Unit', 'Complexity', 'Size', 'Rate', 'Effort']
    deliverable_field_labels = subject.all('.project_phase_deliverable_field_label')
    deliverable_field_labels.should_not be_empty
    deliverable_field_labels.count.should eq @label_names.count
    deliverable_field_labels.each_with_index { |element, index|
      element.should have_content(@label_names[index])
    }

    #test input fields
    should have_selector('input#project_phase_deliverable_name')
    should have_selector('textarea#project_phase_deliverable_description')
    should have_selector('select#project_phase_deliverable_deliverable_type_id')
    should have_selector('select#project_phase_deliverable_uom_id')
    should have_selector('select#project_phase_deliverable_complexity_id')
    should have_selector('input#project_phase_deliverable_size')
    should have_selector('input#project_phase_deliverable_rate')
    should have_selector('input#project_phase_deliverable_effort')
    should have_selector('input#project_phase_deliverable_project_phase_id')

    #test button
    should have_link('Cancel')
    should have_button('Create')
    find("form#new_project_phase_deliverable").native.attributes["action"].to_s.should == "/project_phase_deliverable/create"

    #test deliverable type id dropdown
    deliverables = ["Type 1", "Type 2", "Type 3"] #Lifecycle.all.map {|lifecycle| lifecycle.name}
    page.should have_select("project_phase_deliverable_deliverable_type_id", :options => deliverables)

  end

  it "when click on cancel button, redirect to project index page" do
    click_link('Cancel')
    current_path.should eq "/project_phases/" + @project_phase.id.to_s
  end

end