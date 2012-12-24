require 'spec_helper'

describe Room do
  it "should save new valid group" do
    room = Room.new code: rand(1..9999), name: (0..20).map{(65+rand(25)).chr}.join
    room.save!
  end

  it "should fail without 'code'" do
    room = Room.new name: (0..20).map{(65+rand(25)).chr}.join
    room.should_not be_valid
  end

  it "should fail if 'code' isn't a number" do
    room = Room.new code: 'string', name: (0..20).map{(65+rand(25)).chr}.join
    room.should_not be_valid
  end

  it "should fail without 'name'" do
    room = Room.new code: rand(1..9999)
    room.should_not be_valid
  end
end
