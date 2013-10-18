require 'spec_helper'

describe "projects/index.html.erb" do

  before :all do

    @lifecycleCount = Lifecycle.count
    2.times do |n|
      Project.create!(name: "TestProject"+n.to_s,
                      description: "Great projects"+n.to_s,
                      lifecycle_id: n % @lifecycleCount + 1)
    end
  end

  before :each do
    visit '/projects'
  end

  subject {page}

  it "have appropriate contents" do

    should have_title('Projects')
    should have_content('Existing Projects')
    should have_link("Create New Project")

    #table
    should have_table('projects-table')

    #table header
    tableHeader = find('#projects-table thead tr')
    tableHeader.should have_content("Name")
    tableHeader.should have_content("Description")
    tableHeader.should have_content("Lifecycle")

    #table row
    2.times do |n|
      expect(page).to have_content('Project' + n.to_s)
      expect(page).to have_content('Great projects' + n.to_s)
      expect(page).to have_content(Lifecycle.find(n % @lifecycleCount + 1).name)
    end

  end

  it "redirect to /projects/new when 'Create New Project' is clicked" do
    click_link("Create New Project")
    current_path.should eq("/projects/new")
  end

  it "should have a link in the name column in 'Existing Projects' page" do
    page.find("#row_0").find("a").click
    current_path.should == "/projects/1"
  end

end
