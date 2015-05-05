require 'orientation'

RSpec.describe Orientation do

  context "the orientation is north" do
    orientation = Orientation.north_facing_instance

    it "should have a current orientation of north" do
      expect(orientation.current).to eq(:north)
    end

    it "should face east when turned right" do
      orientation.turn_right!
      expect(orientation.current).to eq(:east)
    end

    it "should face north when turned left" do
      orientation.turn_left!
      expect(orientation.current).to eq(:north)
    end

  end

  context "the orientation is east" do
    orientation = Orientation.east_facing_instance

    it "should have a current orientation of east" do
      expect(orientation.current).to eq(:east)
    end

    it "should face south when turned right" do
      orientation.turn_right!
      expect(orientation.current).to eq(:south)
    end

    it "should face east when turned left" do
      orientation.turn_left!
      expect(orientation.current).to eq(:east)
    end

  end

  context "the orientation is south" do
    orientation = Orientation.south_facing_instance

    it "should have a current orientation of south" do
      expect(orientation.current).to eq(:south)
    end

    it "should face west when turned right" do
      orientation.turn_right!
      expect(orientation.current).to eq(:west)
    end

    it "should face south when turned left" do
      orientation.turn_left!
      expect(orientation.current).to eq(:south)
    end

  end

  context "the orientation is west" do
    orientation = Orientation.west_facing_instance

    it "should have a current orientation of west" do
      expect(orientation.current).to eq(:west)
    end

    it "should face north when turned right" do
      orientation.turn_right!
      expect(orientation.current).to eq(:north)
    end

    it "should face west when turned left" do
      orientation.turn_left!
      expect(orientation.current).to eq(:west)
    end
  end

end