require 'spec_helper'

describe 'New Project' do

  before do
    visit new_project_path
  end

  subject { page }

  it "should have all required view elements" do
    should have_title('Create New Project')
    find('#page_header').text.should eq("Create New Project")

    should have_selector('fieldset')

    #test form labels
    @label_names = ['Name', 'Description', 'Lifecycle']
    project_field_labels = subject.all('.project_field_label')
    project_field_labels.should_not be_empty
    project_field_labels.count.should eq @label_names.count
    project_field_labels.each_with_index { |element, index|
      element.should have_content(@label_names[index])
    }

    #test input fields
    should have_selector('input#project_name')
    should have_selector('textarea#project_description')
    should have_selector('select#project_lifecycle_id')

    #test button
    should have_link('Cancel')
    should have_button('Create')
    find("form#new_project").native.attributes["action"].to_s.should == "/projects/create"

    #test lifecycle names dropdown
    lifecycleNames = Lifecycle.all.map {|lifecycle| lifecycle.name}
    page.should have_select("project_lifecycle_id", :options => lifecycleNames)
  end

  it "when click on cancel button, redirect to project index page" do
    click_link('Cancel')
    current_path.should eq "/projects"
  end
end