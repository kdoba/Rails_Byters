require 'spec_helper'

describe "projects/index.html.erb" do

  before do

    @lifecycleCount = Lifecycle.count
    30.times do |n|
      Project.create!(name: "TestProject"+n.to_s,
                      description: "Great projects"+n.to_s,
                      lifecycle_id: n % @lifecycleCount + 1)
    end
    visit '/projects'
  end

  it "should have a title called 'Projects'" do
    expect(page).to have_title('Projects')
  end

  it "should have a page header 'Existing Projects'" do
    expect(page).to have_content('Existing Projects')
  end

  it "should have a link, displayed as a button, called 'Create New Project'" do
    page.should have_link("Create New Project")
  end

  it "should redirect to /projects/new when 'Create New Project' is clicked" do
    click_link("Create New Project")
    current_path.should eq("/projects/new")
  end

  it "should have a table with headers for name and description" do
    expect(page).to have_table('projects-table')
    expect(page.find('#projects-table thead tr')).to have_content("Name")
    expect(page.find('#projects-table thead tr')).to have_content("Description")
    expect(page.find('#projects-table thead tr')).to have_content("Lifecycle")
  end

  it "should have a content from 'Projects'" do
    30.times do |n|
      expect(page).to have_content('Project' + n.to_s)
      expect(page).to have_content('Great projects' + n.to_s)
      expect(page).to have_content(Lifecycle.find(n % @lifecycleCount + 1).name)
    end
  end

  it "should have a link in the name column in 'Existing Projects' page" do
    page.find("#row_0").find("a").click
    current_path.should == "/projects/1"
  end

end
