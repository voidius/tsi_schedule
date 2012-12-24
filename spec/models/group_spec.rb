require 'spec_helper'

describe Group do
  it "should save new valid group" do
    group = Group.new code: rand(1..9999), name: (0..20).map{(65+rand(25)).chr}.join
    group.save!
  end

  it "should fail without 'code'" do
    group = Group.new name: (0..20).map{(65+rand(25)).chr}.join
    group.should_not be_valid
  end

  it "should fail if 'code' isn't a number" do
    group = Group.new code: 'string', name: (0..20).map{(65+rand(25)).chr}.join
    group.should_not be_valid
  end

  it "should fail without 'name'" do
    group = Group.new code: rand(1..9999)
    group.should_not be_valid
  end
end
