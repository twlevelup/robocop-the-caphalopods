require 'robocop'
require 'melbourne'

RSpec.describe Robocop do
  subject {Robocop.new}

  context "robocop has some default attributes at instance creation" do

    it "has a default orientation" do
      expect(subject.orientation).to eq(:north)
    end

    it "has a default position (corner of Flinders & Swanston Streets)" do
      expect(subject.position).to eq(Melbourne::position(:y => 'Flinders Street', :x => 'Swanston Street'))
    end

  end

  context "robocop can move..." do

    it "robocop can move forward" do
      expect(subject.can_move_forward?).to eq(true)
    end

    it "moves north if facing north" do
      subject.orientation = :north
      old_position = subject.position
      subject.move_forward!
      expect(subject.position[:y]).to eq(old_position[:y] + 1)
      expect(subject.position[:x]).to eq(old_position[:x])
    end

    it "moves south if facing south" do
      subject.orientation = :south
      subject.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      old_position = subject.position
      subject.move_forward!
      expect(subject.position[:y]).to eq(old_position[:y] - 1)
      expect(subject.position[:x]).to eq(old_position[:x])
    end

    it "moves east if facing east" do
      subject.orientation = :east
      old_position = subject.position
      subject.move_forward!
      expect(subject.position[:y]).to eq(old_position[:y])
      expect(subject.position[:x]).to eq(old_position[:x] + 1)
    end

    it "moves west if facing west" do
      subject.orientation = :west
      subject.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      old_position = subject.position
      subject.move_forward!
      expect(subject.position[:y]).to eq(old_position[:y])
      expect(subject.position[:x]).to eq(old_position[:x] - 1)
    end
  end

  context "You can ask robocop if it can move forward" do

    it "should return false if facing north at La Trobe Street (i.e., the north CBD boundary)" do
      subject.orientation = :north
      subject.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(subject.can_move_forward?).to eq(false)
    end

    it "should return false if facing east at Spring Street (i.e., the east CBD boundary)" do
      subject.orientation = :east
      subject.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(subject.can_move_forward?).to eq(false)
    end

    it "should return false if facing west at Spencer Street (i.e., the west CBD boundary)" do
      subject.orientation = :west
      subject.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      expect(subject.can_move_forward?).to eq(false)
    end

    it "should return false if facing south at Flinders Street (i.e., the south CBD boundary)" do
      subject.orientation = :south
      subject.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      expect(subject.can_move_forward?).to eq(false)
    end

  # TODO get the name of blocking/ boundary street:


    #it "raises an exception if it tries to move outside of the boundary" do
    #  subject.position = {:y => Location::NORTH_BOUNDARY, :x => Location::EAST_BOUNDARY}
    #  expect(subject.move_forward).to raise('Trying to move out of bounds.')
    #end

  end

  context "You can query the street names for robocop's current position" do

    it "should return Flinders Street & Swanston Street at robocop's starting position" do
      expect(subject.streets).to eq(:y => 'Flinders Street', :x => 'Swanston Street')
    end

    it "should return La Trobe Street & Spring Street at the north-east corner" do
      subject.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(subject.streets).to eq(:y => 'La Trobe Street', :x => 'Spring Street')
    end

  end

  context "robocop can do other things..." do

    it "should beep" do
      expect(subject.beep).to eq('beep boop')
    end

  end

  context "the robocop is facing north" do

    it "should face east when it's turned right" do
      subject.orientation = :north
      subject.turn_right!
      expect(subject.orientation).to eq(:east)
    end

  end

  context "the robocop is facing east" do

    it "should face south when it's turned right" do
      subject.orientation = :east
      subject.turn_right!
      expect(subject.orientation).to eq(:south)
    end

  end

  context "the robocop is facing south" do

    it "should face west when it's turned right" do
      subject.orientation = :south
      subject.turn_right!
      expect(subject.orientation).to eq(:west)
    end

  end

end
