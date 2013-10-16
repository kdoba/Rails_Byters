require 'spec_helper'

describe 'Project Phase Overview' do
  before do
    @project_phase = FactoryGirl.create(:project_phase, :lifecycle_phase_id => 1, :project_id => 1)
    visit '/project_phases/' + @project_phase.id.to_s
  end

  it "should have a title called  Phase Summary" do
    expect(page).to have_title('Phase Summary')
  end

  it "should have a header called [project_phase_name] Summary" do
    page.find('#page_header').should have_content(@project_phase.name + " Summary")
  end
end
