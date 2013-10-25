require 'spec_helper'

describe DeliverableType do
  it { should belong_to :lifecycle_phase }
  it { should have_many :project_phase_deliverables }
  it { should belong_to :uom }
end
