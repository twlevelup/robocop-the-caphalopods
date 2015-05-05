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

# todo: Refactor this so that it can modify the orientation
  def orientation=(orientation)
    @orientation = orientation if ORIENTATIONS.include?(orientation)
  end

  def position
    @position
  end

  def position=(position)
    @position = position
  end

  def streets
    Melbourne::streets(@position)
  end

  def parallel_street
    # Gives name of street robocop is travelling down
    case orientation
      when :north, :south then
        streets[:x]
      when :east, :west then
        streets[:y]
    end
  end

  def perpendicular_street
    # Gives name of boundary street (when at CBD boundary)
    case orientation
      when :north, :south then
        streets[:y]
      when :east, :west then
        streets[:x]
    end
  end

  def can_move_forward?
    Melbourne::within_CBD?(next_position)
  end

  def move_forward!
    self.position = next_position if can_move_forward?
  end

  def move_to!
    # takes street names, jumps to grid co-ordinate
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
    case orientation
      when :north then
        {:y => position[:y]+1, :x => position[:x]}
      when :south then
        {:y => position[:y]-1, :x => position[:x]}
      when :east then
        {:y => position[:y],   :x => position[:x]+1}
      when :west then
        {:y => position[:y],   :x => position[:x]-1}
    end
  end

end