require 'spec_helper'

describe ProjectPhaseDeliverable do

  context 'field validation' do
    let(:project_phase_deliverable) {ProjectPhaseDeliverable.new}
    before do
      subject {:project_phase_deliverable}
    end

    context "Testing for model field response" do
      it {should respond_to :project_phase_id}
      it {should respond_to :name}
      it {should respond_to :description}
      it {should respond_to :uom_id}
      it {should respond_to :size}
      it {should respond_to :rate}
      it {should respond_to :complexity_id}
      it {should respond_to :deliverable_type_id}
    end

    context "Testing for model field presence validation" do
      it {should validate_presence_of(:project_phase_id)}
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:uom_id)}
      it {should validate_presence_of(:size)}
      it {should validate_presence_of(:rate)}
      it {should validate_presence_of(:complexity_id)}
      it {should validate_presence_of(:deliverable_type_id)}
    end

    context 'Testing for models associations with other tables' do
      it {should belong_to :project_phase}
    end
  end

end