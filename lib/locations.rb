class Locations
	
	def initialize()
		@east_west_streets = 
		[
			'Flinder St',
			'Flinders Lane',
			'Collins St',
			'Little Collins St',
			'Little Bourke St',
			'Bourke St',
			'Lonsdale St',
			'Little Lonsdale St',
			'La Trobe St'
		]

	@north_south_streets = 
		[
			'Spencer St',
			'King St',
			'William St',
			'Market St',
			'Queen St',
			'Elizabeth St',
			'Swanston St',
			'Russell St',
			'Exhibition St',
			'Spring St'
		]
		
	@north_boundary = @east_west_streets.count - 1
	@south_boundary = 0

	end

	def getIntersection(x, y)
		return "Intersection of {@hor.at(x)} and {@ver.at(y)}"
	end

	def getStreetNames(x, y)

	end 

	def within_CBD?(x, y)
		puts "y = #{y}"
		puts "max_y = #{@max_y}"

		result = true

		if y > @north_boundary
			result = false
		end
		
		if y < @south_boundary
			result = false
		end

		return result
	end

end
