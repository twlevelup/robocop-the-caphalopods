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

  def parallel_axis
    # Should this go here (or maybe in location module)?
    case @current
      when :north, :south then :x
      when :east,  :west  then :y
    end
  end

  def perpendicular_axis
    # Should this go here (or maybe in location module)?
    case @current
      when :north, :south then :y
      when :east,  :west  then :x
    end
  end

  def forward_delta
    # Should this go here (or maybe in location module)?
    case @current
      when :north then {:y =>  1, :x =>  0}
      when :south then {:y => -1, :x =>  0}
      when :east  then {:y =>  0, :x =>  1}
      when :west  then {:y =>  0, :x => -1}
    end
  end

  def emoji
    # Should this really go here?
    case @current
      when :north then '^'
      when :south then '^'
      when :east  then '>'
      when :west  then '<'
    end
  end

end