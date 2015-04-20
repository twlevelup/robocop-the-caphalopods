require 'locations'

RSpec.describe Locations do
	let(:l) {Locations.new}

context "when inside CBD boundaries" do

  it "should return true at the north-east corner" do
    expect(l.within_CBD?(Locations::NORTH_BOUNDARY, Locations::EAST_BOUNDARY)).to eq(true)
  end

  it "should return true at the south-west corner" do
    expect(l.within_CBD?(Locations::SOUTH_BOUNDARY, Locations::WEST_BOUNDARY)).to eq(true)
  end

end

context "when outside the CDB boundaries" do

	it "should return false when positioned north of the CBD" do
		expect(l.within_CBD?(Locations::NORTH_BOUNDARY + 1, Locations::WEST_BOUNDARY)).to eq(false)
  end

	it "should return false when positioned south of the CBD" do
		expect(l.within_CBD?(Locations::SOUTH_BOUNDARY - 1, Locations::WEST_BOUNDARY)).to eq(false)
  end

  it "should return false when positioned east of the CBD" do
    expect(l.within_CBD?(Locations::NORTH_BOUNDARY, Locations::EAST_BOUNDARY + 1)).to eq(false)
  end

  it "should return false when positioned west of the CBD" do
    expect(l.within_CBD?(Locations::NORTH_BOUNDARY, Locations::WEST_BOUNDARY - 1)).to eq(false)
  end

end

context "when asking for CBD street names" do

  it "should return false when positioned outside CBD boundaries" do
    expect(l.street_names(Locations::NORTH_BOUNDARY + 1, Locations::WEST_BOUNDARY)).to eq(false)
  end

  it "should return ['Flinders Street', 'Spencer Street'] at the south-west corner" do
    expect(l.street_names(Locations::SOUTH_BOUNDARY, Locations::WEST_BOUNDARY)).to eq(['Flinders Street', 'Spencer Street'])
  end

  # ...

  it "should return ['La Trobe Street', 'Spring Street'] at the north-east corner" do
    expect(l.street_names(Locations::NORTH_BOUNDARY, Locations::EAST_BOUNDARY)).to eq(['La Trobe Street', 'Spring Street'])
  end

end

context "when asking for CBD grid co-ordinates" do

    it "should return false when given an unrecognised street name" do
      expect(l.grid_coordinates('Victoria Street', 'Spencer Street')).to eq(false)
    end

    it "should return coordinates for north-east corner for La Trobe Street - Spring Street intersection" do
      expect(l.grid_coordinates('La Trobe Street', 'Spring Street')).to eq([Locations::NORTH_BOUNDARY, Locations::EAST_BOUNDARY])
    end

    it "should return coordinates for south-west corner for Flinders Street - Spencer Street intersection" do
      expect(l.grid_coordinates('Flinders Street', 'Spencer Street')).to eq([Locations::SOUTH_BOUNDARY, Locations::WEST_BOUNDARY])
    end
end

end