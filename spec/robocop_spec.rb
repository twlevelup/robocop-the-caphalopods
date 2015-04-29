require 'robocop'
require 'melbourne'

RSpec.describe Robocop do
  let(:d) {Robocop.new}

  context "robocop has some default attributes at instance creation" do

    it "has a default orientation" do
      expect(d.orientation).to eq(:north)
    end

    it "has a default position (corner of Flinders & Swanston Streets)" do
      expect(d.position).to eq(Melbourne::position(:y => 'Flinders Street', :x => 'Swanston Street'))
    end

  end

  context "you can set robocop's orientation..." do

    it "to :north" do
      d.orientation = :north
      expect(d.orientation).to eq(:north)
    end

    it "to :south" do
      d.orientation = :south
      expect(d.orientation).to eq(:south)
    end

    it "to :east" do
      d.orientation = :east
      expect(d.orientation).to eq(:east)
    end

    it "to :west" do
      d.orientation = :west
      expect(d.orientation).to eq(:west)
    end

    it "orientation won't change if unrecognised orientation is given (e.g., :down)" do
      d.orientation = :west
      expect(d.orientation).to eq(:west)
      d.orientation = :down
      expect(d.orientation).to eq(:west)
    end

  end

  context "robocop can move..." do

    it "robocop can move forward" do
      expect(d.can_move_forward?).to eq(true)
    end

    it "moves north if facing north" do
      d.orientation = :north
      old_position = d.position
      d.move_forward!
      expect(d.position[:y]).to eq(old_position[:y] + 1)
      expect(d.position[:x]).to eq(old_position[:x])
    end

    it "moves south if facing south" do
      d.orientation = :south
      d.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      old_position = d.position
      d.move_forward!
      expect(d.position[:y]).to eq(old_position[:y] - 1)
      expect(d.position[:x]).to eq(old_position[:x])
    end

    it "moves east if facing east" do
      d.orientation = :east
      old_position = d.position
      d.move_forward!
      expect(d.position[:y]).to eq(old_position[:y])
      expect(d.position[:x]).to eq(old_position[:x] + 1)
    end

    it "moves west if facing west" do
      d.orientation = :west
      d.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      old_position = d.position
      d.move_forward!
      expect(d.position[:y]).to eq(old_position[:y])
      expect(d.position[:x]).to eq(old_position[:x] - 1)
    end
  end

  context "You can ask robocop if it can move forward" do

    it "should return false if facing north at La Trobe Street (i.e., the north CBD boundary)" do
      d.orientation = :north
      d.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(d.can_move_forward?).to eq(false)
    end

    it "should return false if facing east at Spring Street (i.e., the east CBD boundary)" do
      d.orientation = :east
      d.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(d.can_move_forward?).to eq(false)
    end

    it "should return false if facing west at Spencer Street (i.e., the west CBD boundary)" do
      d.orientation = :west
      d.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      expect(d.can_move_forward?).to eq(false)
    end

    it "should return false if facing south at Flinders Street (i.e., the south CBD boundary)" do
      d.orientation = :south
      d.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      expect(d.can_move_forward?).to eq(false)
    end

  # TODO get the name of blocking/ boundary street:


    #it "raises an exception if it tries to move outside of the boundary" do
    #  d.position = {:y => Location::NORTH_BOUNDARY, :x => Location::EAST_BOUNDARY}
    #  expect(d.move_forward).to raise('Trying to move out of bounds.')
    #end

  end

  context "You can query the street names for robocop's current position" do

    it "should return Flinders Street & Swanston Street at robocop's starting position" do
      expect(d.streets).to eq(:y => 'Flinders Street', :x => 'Swanston Street')
    end

    it "should return La Trobe Street & Spring Street at the north-east corner" do
      d.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(d.streets).to eq(:y => 'La Trobe Street', :x => 'Spring Street')
    end

  end

  context "robocop can do other things..." do

    it "should beep" do
      expect(d.beep).to eq('beep boop')
    end

  end

end
