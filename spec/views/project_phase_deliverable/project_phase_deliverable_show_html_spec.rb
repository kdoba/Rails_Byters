require 'spec_helper'

describe 'Project Phase Deliverable Show page' do
  before do
    @project = FactoryGirl.create(:project)
    @project_phase = ProjectPhase.find_all_by_project_id(@project.id).first
    @deliverable = FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id)

    visit '/project_phase_deliverable/' + @deliverable.id.to_s
  end

  subject { page }

  it "should have all required view elements" do
    should have_title("Edit Deliverable")
    subject.find('#page_header').should have_content("Edit " + @deliverable.name)

    # test form labels
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
    should have_button('Edit')
    #find("form#new_project_phase_deliverable").native.attributes["action"].to_s.should == "/project_phase_deliverable/create"
  end

  it "should have values fetched from the database into the input fields" do
    find('input#project_phase_deliverable_name').value.should eq "First Deliverable"
    find('textarea#project_phase_deliverable_description').should have_text "yay"

    types        = DeliverableType.find_all_by_lifecycle_phase_id(@project_phase.lifecycle_phase_id).map {|type| type.name}
    uom          = ProjectPhaseDeliverable.units_of_measurement.collect{ |index, value| value }
    complexities = ProjectPhaseDeliverable.complexities.collect{ |index, value| value }

    should have_select("project_phase_deliverable_deliverable_type_id", :selected => types[0], :options => types)
    should have_select("project_phase_deliverable_uom_id",              :selected => "Words",  :options => uom)
    should have_select("project_phase_deliverable_complexity_id",       :selected => "Simple",  :options => complexities)

    find('input#project_phase_deliverable_size').value.should eq "1"
    find('input#project_phase_deliverable_rate').value.should eq "1"
  end
end