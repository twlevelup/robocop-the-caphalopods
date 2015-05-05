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

  def turn_right!
    if @current == :north
      @current = :east
    elsif @current == :east
      @current = :south
    elsif @current == :south
      @current = :west
    elsif @current == :west
      @current = :north
    end
  end

  def turn_left!
    if @current == :north
      @current = :west
    elsif @current == :east
      @current = :north
    elsif @current == :south
      @current = :east
    elsif @current == :west
      @current = :south
    end
  end

end