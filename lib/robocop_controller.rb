require_relative "robocop"

class RobocopController

  def initialize
    @cop = Robocop.new
  end

  def robocop
    @cop
  end

  def move_robot_forward!
    if @cop.can_move_forward?
      @cop.move_forward
      output("Moving cop forward")
      current_status
    else
      output("Error: Cannot perform command, move forward, movement is invalid")
    end
  end

  def current_status
    puts "The robot is at intersection of #{@cop.street_names.join(' and ')}, facing #{@cop.orientation}."
  end

  def output(string)
    puts ""
    puts string
    puts ""
  end

end
