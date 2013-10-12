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

  it "should have a form where post action calls /projects/create" do
    page.find("form#project_create_form").native.attributes["action"].to_s.should == "/projects/create"
  end

  it "should have three lifecycles in the lifecycle dropdown" do
    page.should have_select("lifecycle", :options => ["Agile", "Simple Waterfall", "Waterfall"])
  end
end