require 'spec_helper'

describe ProjectPhaseDeliverable do

  context 'field validation' do
    let(:project_phase_deliverable) {ProjectPhaseDeliverable.new}
    before do
      subject {:project_phase_deliverable}
    end

    it { should belong_to :deliverable_type }

    context "Testing for model field response" do
      it {should respond_to :project_phase_id}
      it {should respond_to :name}
      it {should respond_to :description}
      it {should respond_to :uom_id}
      it {should respond_to :size}
      it {should respond_to :rate}
      it {should respond_to :complexity_id}
      it {should respond_to :deliverable_type_id}
      it {should respond_to :effort}
    end

    context "Testing for model field presence validation" do
      it {should validate_presence_of(:project_phase_id)}
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:uom_id)}
      it {should validate_presence_of(:size)}
      it {should validate_presence_of(:rate)}
      it {should validate_presence_of(:complexity_id)}
      it {should validate_presence_of(:deliverable_type_id)}
      it {should validate_presence_of(:effort)}
    end

    context 'Testing for models associations with other tables' do
      it {should belong_to :project_phase}
      it {should belong_to :uom}
    end

    context 'complexity_string, deliverable_type_string, uom_string method' do

      it {
        should respond_to :complexity_string
        should respond_to :uom_string
      }

      it "should returns the correct string based on complexity_id" do
        @deliverable = ProjectPhaseDeliverable.new(complexity_id: 1, deliverable_type_id: 1, uom_id: 1)
        @deliverable.complexity_string.should eq ProjectPhaseDeliverable.complexities[1]
        @deliverable.deliverable_type.name.should eq DeliverableType.find(1).name
        @deliverable.uom_string.should eq Uom.all[1].name
      end
    end
  end

end