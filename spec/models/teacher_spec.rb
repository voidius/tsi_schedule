require 'spec_helper'

describe Teacher do
  it "should save new valid group" do
    teacher = Teacher.new code: rand(1..9999), name: (0..20).map{(65+rand(25)).chr}.join
    teacher.save!
  end

  it "should fail without 'code'" do
    teacher = Teacher.new name: (0..20).map{(65+rand(25)).chr}.join
    teacher.should_not be_valid
  end

  it "should fail if 'code' isn't a number" do
    teacher = Teacher.new code: 'string', name: (0..20).map{(65+rand(25)).chr}.join
    teacher.should_not be_valid
  end

  it "should fail without 'name'" do
    teacher = Teacher.new code: rand(1..9999)
    teacher.should_not be_valid
  end
end
