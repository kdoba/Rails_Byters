require 'spec_helper'

describe 'New Project' do

  before do
    visit new_project_path
  end

  it "should have a title called Create New Project" do
    expect(page).to have_title('Create New Project')
  end

  it "should have a heading called Create New Project" do
    page.find('#page_header').text.should eq("Create New Project")
  end

  it "should have a fieldset with empty legend" do
    page.should have_selector('fieldset')
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
    expect(page).to have_selector('input#project_name')
    expect(page).to have_selector('textarea#project_description')
    expect(page).to have_selector('select#project_lifecycle_id')
  end

  it "should have button Submit" do
    expect(page).to have_button('Submit')
  end

  it "should have a form where post action calls /projects/create" do
    page.find("form#new_project").native.attributes["action"].to_s.should == "/projects/create"
  end

  it "should have all lifecycle names in the lifecycle dropdown" do
    lifecycleNames = Lifecycle.all.map {|lifecycle| lifecycle.name}
    page.should have_select("project_lifecycle_id", :options => lifecycleNames)
  end

  it "should have a cancel button that redirects to project index page" do
    page.should have_link('Cancel')
    click_link('Cancel')
    current_path.should eq "/projects"
  end
end