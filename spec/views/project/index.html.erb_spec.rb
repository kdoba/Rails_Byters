require 'spec_helper'

describe "projects/index.html.erb" do

  it "should have a title called 'Projects'" do
    visit '/projects'
    expect(page).to have_title('Projects')
  end

  it "should have a content from 'Projects'" do
    visit '/projects'
    30.times do |n|
      #Projects.get
      expect(page).to have_content('Project' + n.to_s)
    end
  end
end
