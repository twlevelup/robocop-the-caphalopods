require 'locations'

RSpec.describe Locations do
	let(:l) {Locations.new}



# def getIntersection(x, y)

#	def getStreetNames(x, y)

#	def isWithinCBD(x, y)
context "when it is inside CBD boundaries" do
	it "should return true at the north-west corner" do
		expect(l.within_CBD?(0,8)).to eq(true)
	end
	it "should return true at the south-west corner" do
		expect(l.within_CBD?(0,0)).to eq(true)
	end

end
context "when it is outside the CDB boundaries" do
	it "should return false when positioned north of the CBD" do
		expect(l.within_CBD?(0,9)).to eq(false)
	end
	it "should return false when positioned south of the CBD" do
		expect(l.within_CBD?(0,-1)).to eq(false)
	end
end
end