require 'spec_helper'

describe Uom do
  it { should respond_to :name }
  it { should have_many :deliverable_types }
  it { should have_many :project_phase_deliverables }
end
