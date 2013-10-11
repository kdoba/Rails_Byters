require "spec_helper.rb"

describe "Routing" do
  it "routes /projects/create to projects#create" do
    expect(post("/projects/create")).to route_to("projects#create")
  end
end