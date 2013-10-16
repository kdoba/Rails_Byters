require "spec_helper.rb"

describe "Routing" do
  it "routes /projects/create to projects#create" do
    expect(post("/projects/create")).to route_to("projects#create")
  end

  it "routes /project_phases/1 to project_phases#show" do
    expect(get("/project_phases/1")).to route_to("project_phases#show", :id => "1")
  end
end