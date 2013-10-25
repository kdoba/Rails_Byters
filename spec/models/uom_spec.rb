require 'spec_helper'

describe Uom do
  it { should respond_to :name }
  it { should have_many :deliverable_types }
  it { should have_many :project_phase_deliverables }

  it "getAllUoms should have right values" do
    uomArray = Uom.getAllForSelect
    uomArray.should be_a Array
    uomArray.count.should eq Uom.count
  end
end
