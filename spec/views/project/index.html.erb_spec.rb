require 'spec_helper'

describe "projects/index.html.erb" do

  before do
    30.times do |n|
      Project.create!(name: "Project"+n.to_s,
                      description: "Great projects"+n.to_s)
    end

    visit '/projects'
  end

  it "should have a title called 'Projects'" do
    expect(page).to have_title('Projects')
  end

  it "should have a page header 'Existing Projects'" do
    expect(page).to have_content('Existing Projects')
  end

  it "should have a table with headers for name and description" do
    expect(page).to have_table('projects-table')
    expect(page.find('#projects-table thead tr')).to have_content("Name")
    expect(page.find('#projects-table thead tr')).to have_content("Description")
  end

  it "should have a content from 'Projects'" do
    30.times do |n|
      expect(page).to have_content('Project' + n.to_s)
    end
  end
end
