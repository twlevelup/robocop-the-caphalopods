module Melbourne

  # THE HODDLE (CBD) GRID
  # See Wikipedia: https://

  # Note: South-west corner = (0,0)

  EAST_WEST_STREETS = [
      'Flinders Street',
      'Flinders Lane',
      'Collins Street',
      'Little Collins Street',
      'Bourke Street',
      'Little Bourke Street',
      'Lonsdale Street',
      'Little Lonsdale Street',
      'La Trobe Street']

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
      'Spring Street']

  SOUTH_BOUNDARY  = 0
  WEST_BOUNDARY   = 0
  NORTH_BOUNDARY  = EAST_WEST_STREETS.count - 1
  EAST_BOUNDARY   = NORTH_SOUTH_STREETS.count - 1
  CBD_GRID_WIDTH  = NORTH_SOUTH_STREETS.count
  CBD_GRID_HEIGHT = EAST_WEST_STREETS.count

  def self.within_CBD?(position)
    raise 'Missing method parameter/s' unless (position[:y] && position[:x])

    if (position[:y] > NORTH_BOUNDARY || position[:y] < SOUTH_BOUNDARY ||
        position[:x] > EAST_BOUNDARY || position[:x] < WEST_BOUNDARY)
      return false
    else
      return true
    end
  end

  # takes a grid position - returns street names:

  def self.streets(position)
    raise 'Missing method parameter/s' unless (position[:y] && position[:x])

    return if not within_CBD?(position)
    return {:y => EAST_WEST_STREETS[position[:y]], :x => NORTH_SOUTH_STREETS[position[:x]]}
  end

  # takes street names - returns a grid position:

  def self.position(streets)
    raise 'Missing method parameter/s' unless (streets[:y] && streets[:x])

    y = EAST_WEST_STREETS.find_index(streets[:y])
    x = NORTH_SOUTH_STREETS.find_index(streets[:x])
    return if (y == nil || x == nil)
    return {:y => y, :x => x}
  end

end