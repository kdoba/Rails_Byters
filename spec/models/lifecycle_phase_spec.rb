require 'spec_helper'

describe LifecyclePhase do
  it "should respond to name, description, sequenceNumber" do
    should respond_to :name
    should respond_to :description
    should respond_to :sequenceNumber
  end

  it "should not have a name field that is empty" do
    LifecyclePhase.new(:name => "").should_not be_valid
  end

  it "should not have a sequenceNumber that is empty" do
    LifecyclePhase.new(:sequenceNumber => "").should_not be_valid
  end

  it "should belong to a lifecycle" do
    should belong_to :lifecycle
  end

end