require 'melbourne'

RSpec.describe Melbourne do

context "when inside CBD boundaries" do

  it "should return true at the north-east corner" do
    expect(Melbourne::within_CBD?(:y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY)).to eq(true)
  end

  it "should return true at the south-west corner" do
    expect(Melbourne::within_CBD?(:y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY)).to eq(true)
  end

end

context "when outside the CDB boundaries" do

  it "should return false when positioned north of the CBD" do
    expect(Melbourne::within_CBD?(:y => Melbourne::NORTH_BOUNDARY + 1, :x => Melbourne::WEST_BOUNDARY)).to eq(false)
  end

  it "should return false when positioned south of the CBD" do
    expect(Melbourne::within_CBD?(:y => Melbourne::SOUTH_BOUNDARY - 1, :x => Melbourne::WEST_BOUNDARY)).to eq(false)
  end

  it "should return false when positioned east of the CBD" do
    expect(Melbourne::within_CBD?(:y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY + 1)).to eq(false)
  end

  it "should return false when positioned west of the CBD" do
    expect(Melbourne::within_CBD?(:y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY - 1)).to eq(false)
  end

end

context "when asking for CBD street names" do

  it "should return nil when positioned outside CBD boundaries" do
    expect(Melbourne::streets(:y => Melbourne::NORTH_BOUNDARY + 1, :x => Melbourne::WEST_BOUNDARY)).to eq(nil)
  end

  it "should return Flinders Street & Spencer Street at the south-west corner" do
    expect(Melbourne::streets(:y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY)).to eq(:y => 'Flinders Street', :x => 'Spencer Street')
  end

  # ...

  it "should return La Trobe Street & Spring Street at the north-east corner" do
    expect(Melbourne::streets(:y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY)).to eq(:y => 'La Trobe Street', :x => 'Spring Street')
  end

end

context "when asking for CBD grid co-ordinates" do

    it "should return nil when given an unrecognised street name" do
      expect(Melbourne::position(:y => 'Victoria Street', :x => 'Spencer Street')).to eq(nil)
    end

    it "should return correct coordinates for La Trobe & Spring Streets intersection" do
      expect(Melbourne::position(:y => 'La Trobe Street', :x => 'Spring Street')).to eq(:y => Melbourne::NORTH_BOUNDARY, :x => Melbourne::EAST_BOUNDARY)
    end

    it "should return correct coordinates for Flinders & Spencer Streets intersection" do
      expect(Melbourne::position(:y => 'Flinders Street', :x => 'Spencer Street')).to eq(:y => Melbourne::SOUTH_BOUNDARY, :x => Melbourne::WEST_BOUNDARY)
    end
end

end