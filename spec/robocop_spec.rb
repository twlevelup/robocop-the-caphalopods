require 'robocop'
require 'melbourne'

RSpec.describe Robocop do

  context "A new Robocop without any arguments" do

    let(:robocop) { Robocop.new }

    it "should be facing north" do
      expect(robocop.orientation).to eq(:north)
    end

    it "should be at the corner of Flinders Street and Swanston Street" do
      expect(robocop.position).to eq(Melbourne::position(:y => 'Flinders Street', :x => 'Swanston Street'))
    end

    it "can move forward" do
      expect(robocop.can_move_forward?).to eq(true)
    end

    it "should return Flinders Street & Swanston Street at robocop's starting position" do
      expect(robocop.streets).to eq(:y => 'Flinders Street', :x => 'Swanston Street')
    end

    it "should return La Trobe Street & Spring Street at the north-east corner" do
      robocop.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(robocop.streets).to eq(:y => 'La Trobe Street', :x => 'Spring Street')
    end

    it "should beep boop when asked to beep" do
      expect(robocop.beep).to eq('beep boop')
    end

  end

  context "A new Robocop facing north" do

    let(:robocop) {Robocop.new(Orientation.north_facing_instance)}

    it "should move north when asked to move forward" do
      old_position = robocop.position
      robocop.move_forward!
      expect(robocop.position[:y]).to eq(old_position[:y] + 1)
      expect(robocop.position[:x]).to eq(old_position[:x])
    end

  end

  context "A new Robocop facing south" do

    let(:robocop) {Robocop.new(Orientation.south_facing_instance)}

    it "should move south when asked to move forward" do
      robocop.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      old_position = robocop.position
      robocop.move_forward!
      expect(robocop.position[:y]).to eq(old_position[:y] - 1)
      expect(robocop.position[:x]).to eq(old_position[:x])
    end

  end

  context "A new Robocop facing east" do

    let(:robocop) {Robocop.new(Orientation.east_facing_instance)}

    it "should move east when asked to move forward" do
      old_position = robocop.position
      robocop.move_forward!
      expect(robocop.position[:y]).to eq(old_position[:y])
      expect(robocop.position[:x]).to eq(old_position[:x] + 1)
    end

  end

  context "A new Robocop facing west" do

    let(:robocop) {Robocop.new(Orientation.west_facing_instance)}

    it "should move west when asked to move forward" do
      robocop.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      old_position = robocop.position
      robocop.move_forward!
      expect(robocop.position[:y]).to eq(old_position[:y])
      expect(robocop.position[:x]).to eq(old_position[:x] - 1)
    end

  end

  context "A new Robocop facing north at La Trobe Street" do

    let(:robocop) {Robocop.new(Orientation.north_facing_instance)}

    it "shouldn't be able to move forward" do
      robocop.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(robocop.can_move_forward?).to eq(false)
    end

  end

  context "A new Robocop facing east at Spring Street" do

    let(:robocop) {Robocop.new(Orientation.east_facing_instance)}

    it "shouldn't be able to move forward" do
      robocop.position = { :y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY }
      expect(robocop.can_move_forward?).to eq(false)
    end

  end

  context "A new Robocop facing west at Spencer Street" do

    let(:robocop) {Robocop.new(Orientation.west_facing_instance)}

    it "shouldn't be able to move forward" do
      robocop.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      expect(robocop.can_move_forward?).to eq(false)
    end

  end

  context "A new Robocop facing south at Flinders Street" do

    let(:robocop) {Robocop.new(Orientation.south_facing_instance)}

    it "shouldn't be able to move forward" do
      robocop.position = { :y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY }
      expect(robocop.can_move_forward?).to eq(false)
    end

  end

end
