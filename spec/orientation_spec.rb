require 'orientation'

RSpec.describe Orientation do

  context "the orientation is north" do
    orientation = Orientation.north_facing_instance

    it "should have a current orientation of north" do
      expect(orientation.current).to eq(:north)
    end

  end

  context "the orientation is east" do
    orientation = Orientation.east_facing_instance

    it "should have a current orientation of east" do
      expect(orientation.current).to eq(:east)
    end
  end

  context "the orientation is south" do
    orientation = Orientation.south_facing_instance

    it "should have a current orientation of south" do
      expect(orientation.current).to eq(:south)
    end
  end

  context "the orientation is west" do
    orientation = Orientation.west_facing_instance

    it "should have a current orientation of west" do
      expect(orientation.current).to eq(:west)
    end
  end

end