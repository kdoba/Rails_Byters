require 'spec_helper'

describe 'Project Phase Deliverable Show page' do
  before do
    @project = FactoryGirl.create(:project)
    @project_phase = ProjectPhase.find_all_by_project_id(@project.id).first
    @deliverable = FactoryGirl.create(:project_phase_deliverable, :project_phase_id => @project_phase.id)

    visit '/project_phase_deliverable/' + @deliverable.id.to_s
  end

  subject { page }

  it "has all required view elements" do
    should have_title("Edit Deliverable")
    subject.find('#page_header').should have_content("Edit " + @deliverable.name)

    # test form labels
    @label_names = ['Name', 'Description', 'Complexity']
    deliverable_field_labels = subject.all('.deliverable_field_label')
    deliverable_field_labels.should_not be_empty
    deliverable_field_labels.count.should eq @label_names.count
    deliverable_field_labels.each_with_index { |element, index|
      element.should have_content(@label_names[index])
    }

    #test input fields
    should have_selector('input#project_phase_deliverable_name')
    should have_selector('textarea#project_phase_deliverable_description')
    should have_selector('select#project_phase_deliverable_complexity_id')
  end
end