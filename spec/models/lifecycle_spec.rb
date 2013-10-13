require 'spec_helper'

describe Lifecycle do

  it "should respond to name and description" do
    should respond_to :name
    should respond_to :description
  end

  it "should not have name field that is empty" do
   Lifecycle.new(:name => "").should_not be_valid
  end

  it "should not have lifecycle with duplicate names" do
    Lifecycle.create!(:name => "test1")
    duplicate_lifecycle = Lifecycle.new(:name => "test1")
    duplicate_lifecycle.should_not be_valid
  end

  it "should have many lifecycle phases" do
    should have_many :lifecycle_phases
  end

  it {should have_many :projects}
end