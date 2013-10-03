require 'spec_helper'


describe 'Project Overview' do

  before do
    #project = FactoryGirl.generate(:project)
    @project = FactoryGirl.create(:project)
    visit '/projects/' + @project.id.to_s
  end

  it "should have a title called Project Overview" do
    expect(page).to have_title('Project Overview')
  end

  it "should have labels for name, description, and lifecycle" do
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Lifecycle')
  end

  it "should have input fields for project name, description, and lifecycle " do
    expect(page).to have_selector('input#name')
    expect(page).to have_selector('input#description')
    expect(page).to have_selector('input[id=lifecycle][disabled]')
  end

  it "should have a label and input field for total estimation " do
    expect(page).to have_content('Total Estimation')
    expect(page).to have_selector('input[id=total_estimation][disabled]')
  end

  it "should have buttons for Save, Cancel, and Delete actions " do
    expect(page).to have_button('Submit')
    expect(page).to have_button('Back')
    expect(page).to have_button('Delete')
  end
end
