require 'location'

class Robocop

  ORIENTATIONS = [:north, :south, :east, :west]

  def initialize()
    @cbd = Location.new
    @orientation = ORIENTATIONS.first
    @position = { :y => 0, :x => 0}
  end

  def beep
    'beep boop'
  end

  def orientation
    @orientation
  end

  def orientation=(orientation)
    return if not ORIENTATIONS.include?(orientation)
    @orientation = orientation
  end

  def position
    @position
  end

  def position=(position)
    @position = position
  end

  def street_names
    @cbd.street_names(@position[:y], @position[:x])
  end

  def move_to
    # takes street names, jumps to grid co-ordinate
  end

  def move_forward
    self.position = next_position if can_move_forward?
  end

  def can_move_forward?
    @cbd.within_CBD?(next_position[:y], next_position[:x])
  end

  def next_position
    # Returns expected next position,
    # but doesn't move the robot yet
    next_position = case @orientation
                      when :north then { :y => position[:y]+1, :x => position[:x]   }
                      when :south then { :y => position[:y]-1, :x => position[:x]   }
                      when :east  then { :y => position[:y],   :x => position[:x]+1 }
                      when :west  then { :y => position[:y],   :x => position[:x]-1 }
                    end
  end

end