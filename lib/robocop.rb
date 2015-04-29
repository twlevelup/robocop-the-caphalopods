require_relative 'melbourne'

class Robocop

  ORIENTATIONS = [:north, :south, :east, :west]
  EMOJIS       = { :north => '^', :south => '^', :east => '>', :west => '<' }

  def initialize()
    @orientation = ORIENTATIONS.first
    @position    = Melbourne::position(:y => 'Flinders Street', :x => 'Swanston Street')
  end

  def beep
    'beep boop'
  end

  def orientation
    @orientation
  end

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
        {:y => position[:y], :x => position[:x]+1}
      when :west then
        {:y => position[:y], :x => position[:x]-1}
    end
  end

end