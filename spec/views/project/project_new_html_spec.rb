require 'spec_helper'

describe 'New Project' do

  before do
    visit new_project_path
  end

  it "should have a title called Create New Project" do
    expect(page).to have_title('Create New Project')
  end

  it "should have labels for Name, description, and lifecycle" do
    @label_names = ['Name', 'Description', 'Lifecycle']
    page.all('.project_field_label').should_not be_empty
    page.all('.project_field_label').count.should == @label_names.count
    page.all('.project_field_label').each_with_index { |element, index|
      element.should have_content(@label_names[index])
    }
  end

  it "should have input fields for project name, description, and lifecycle " do
    expect(page).to have_selector('input#name')
    expect(page).to have_selector('input#description')
    expect(page).to have_selector('select#lifecycle')
  end

  it "should have button Submit" do
    expect(page).to have_button('Submit')
  end

  #it "clicking the submit button should redirect to project index" do
  #  click_button "Submit"
  #  @newProject = assigns(:new_project)
  #  current_path.should == "/projects/" + @newProject.id.to_s
  #end
  #
  #it "infers the controller path" do
  #  expect(controller.request.path_parameters[:action]).to eq("new")
  #end

end