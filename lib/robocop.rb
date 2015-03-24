# Make sure no 'new' headings can be made?
module Heading
  :north
  :south
  :east
  :west
end

class Robocop

  def initialize()
    @heading = :north
    @position = [0, 0]
  end


  def beep
    'beep boop'
  end

  def can_move_forward?
    true
  end

  ##
  # Assume that the positive second element is north, and positive first element is east.
  # This deserve refactoring so that it just passes a 'velocity' vector to a general move method.
  def move_forward
    old_position = get_position
    case
      when @heading == :north
        set_position(old_position[0], old_position[1]+1)
      when @heading == :south
        set_position(old_position[0], old_position[1]-1)
      when @heading == :east
        set_position(old_position[0]+1, old_position[1])
      when @heading == :west
        set_position(old_position[0]-1, old_position[1])
    end
    get_position
  end

  def set_heading(headed)
    @heading = headed
  end

  def get_heading
    return @heading
  end

  def get_position
    @position
  end

  def set_position(xy_array)
    xy_array.is_a?(Array)
    xy_array.array.size.must_equal(2)
    xy_array.all? { |i| i.is_a?(Numeric)}
  end

  def set_position(x_position, y_position)
    if x_position.is_a?(Numeric) and y_position.is_a?(Numeric)
      @position = [x_position, y_position]
      return true
    else
      false
    end
  end



end
