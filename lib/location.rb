class Location

  # THE HODDLE (CBD) GRID
  # See Wikipedia: https://

  # Note: South-west corner = (0,0)

  EAST_WEST_STREETS = [
          'Flinders Street',
          'Flinders Lane',
          'Collins Street',
          'Little Collins Street',
          'Little Bourke Street',
          'Bourke Street',
          'Lonsdale Street',
          'Little Lonsdale Street',
          'La Trobe Street' ]

  NORTH_SOUTH_STREETS = [
          'Spencer Street',
          'King Street',
          'William Street',
          'Market Street',
          'Queen Street',
          'Elizabeth Street',
          'Swanston Street',
          'Russell Street',
          'Exhibition Street',
          'Spring Street' ]

  SOUTH_BOUNDARY = 0
  WEST_BOUNDARY  = 0
  NORTH_BOUNDARY = EAST_WEST_STREETS.count - 1
  EAST_BOUNDARY  = NORTH_SOUTH_STREETS.count - 1

  def within_CBD?(y, x)

		result = true

		if (y > NORTH_BOUNDARY || y < SOUTH_BOUNDARY ||
        x > EAST_BOUNDARY  || x < WEST_BOUNDARY)
      result = false
    end

    return result
	end

  # takes grid co-ordinates; returns street names
  def street_names(y, x)

    return false if within_CBD?(y, x) == false

    # return location as two strings (leave
    # any string formatting to the caller...)
    return [EAST_WEST_STREETS[y], NORTH_SOUTH_STREETS[x]]

  end

  # Takes street names; returns grid co-ordinates
  def grid_coordinates(y_streetname, x_streetname)

    y = EAST_WEST_STREETS.find_index(y_streetname)
    x = NORTH_SOUTH_STREETS.find_index(x_streetname)

    return false if (y == nil || x == nil)

    return [y, x]

  end

end
