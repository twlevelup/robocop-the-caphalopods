require 'location'

RSpec.describe Location do
	let(:l) {Location.new}

context "when inside CBD boundaries" do

  it "should return true at the north-east corner" do
    expect(l.within_CBD?(Location::NORTH_BOUNDARY, Location::EAST_BOUNDARY)).to eq(true)
  end

  it "should return true at the south-west corner" do
    expect(l.within_CBD?(Location::SOUTH_BOUNDARY, Location::WEST_BOUNDARY)).to eq(true)
  end

end

context "when outside the CDB boundaries" do

	it "should return false when positioned north of the CBD" do
		expect(l.within_CBD?(Location::NORTH_BOUNDARY + 1, Location::WEST_BOUNDARY)).to eq(false)
  end

	it "should return false when positioned south of the CBD" do
		expect(l.within_CBD?(Location::SOUTH_BOUNDARY - 1, Location::WEST_BOUNDARY)).to eq(false)
  end

  it "should return false when positioned east of the CBD" do
    expect(l.within_CBD?(Location::NORTH_BOUNDARY, Location::EAST_BOUNDARY + 1)).to eq(false)
  end

  it "should return false when positioned west of the CBD" do
    expect(l.within_CBD?(Location::NORTH_BOUNDARY, Location::WEST_BOUNDARY - 1)).to eq(false)
  end

end

context "when asking for CBD street names" do

  it "should return false when positioned outside CBD boundaries" do
    expect(l.street_names(Location::NORTH_BOUNDARY + 1, Location::WEST_BOUNDARY)).to eq(false)
  end

  it "should return ['Flinders Street', 'Spencer Street'] at the south-west corner" do
    expect(l.street_names(Location::SOUTH_BOUNDARY, Location::WEST_BOUNDARY)).to eq(['Flinders Street', 'Spencer Street'])
  end

  # ...

  it "should return ['La Trobe Street', 'Spring Street'] at the north-east corner" do
    expect(l.street_names(Location::NORTH_BOUNDARY, Location::EAST_BOUNDARY)).to eq(['La Trobe Street', 'Spring Street'])
  end

end

context "when asking for CBD grid co-ordinates" do

    it "should return false when given an unrecognised street name" do
      expect(l.grid_coordinates('Victoria Street', 'Spencer Street')).to eq(false)
    end

    it "should return correct coordinates for La Trobe & Spring Streets intersection" do
      expect(l.grid_coordinates('La Trobe Street', 'Spring Street')).to eq([Location::NORTH_BOUNDARY, Location::EAST_BOUNDARY])
    end

    it "should return correct coordinates for Flinders & Spencer Streets intersection" do
      expect(l.grid_coordinates('Flinders Street', 'Spencer Street')).to eq([Location::SOUTH_BOUNDARY, Location::WEST_BOUNDARY])
    end
end

end