require_relative 'melbourne'
require_relative 'orientation'

class Robocop

  def initialize(orientation = Orientation.north_facing_instance)
    @orientation = orientation
    @position    = Melbourne::position(:y => 'Flinders Street', :x => 'Swanston Street')
  end

  def orientation
    @orientation.current
  end

  def position
    @position
  end

  def position=(position)
    @position = position
  end

  def streets
    Melbourne::streets(position)
  end

  def parallel_street
    streets[@orientation.parallel_axis]
  end

  def perpendicular_street
    streets[@orientation.perpendicular_axis]
  end

  def can_move_forward?
    Melbourne::within_CBD?(next_position)
  end

  def move_forward!
    self.position = next_position if can_move_forward?
  end

  def turn_right!
    @orientation.turn_right!
  end

  def turn_left!
    @orientation.turn_left!
  end

  private

  def next_position
    # Returns expected next position,
    # but doesn't move the robot yet:
    {:y => position[:y] + @orientation.forward_delta[:y],
     :x => position[:x] + @orientation.forward_delta[:x]}
  end

end