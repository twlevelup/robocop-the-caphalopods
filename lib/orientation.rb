class Orientation

  def initialize(starting_orientation)
    @current = starting_orientation
  end

  def self.north_facing_instance
    Orientation.new(:north)
  end

  def self.east_facing_instance
    Orientation.new(:east)
  end

  def self.south_facing_instance
    Orientation.new(:south)
  end

  def self.west_facing_instance
    Orientation.new(:west)
  end

  def current
    @current
  end

end