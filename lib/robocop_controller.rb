# require_relative "model"
require_relative "robocop"

class RobocopController

  @@actions = {

      'help'          => :help,
      'h'             => :help,

      'forward'       => :move_forward,
      'f'             => :move_forward,

      'right'         => :turn_right,
      'r'             => :turn_right,

      'left'          => :turn_left,
      'l'             => :turn_left,

      'add'           => :add_robot,
      'a'             => :add_robot,

      'choose'        => :select_robot,
      'c'             => :select_robot,

      'map'           => :display_map,
      'm'             => :display_map,

      'status'        => :status,
      's'             => :status,

      'quit'          => :quit,
      'q'             => :quit,

      # TODO add more commands here
  }

  @@actions.default   =  :invalid_command

  def actions
    @@actions
  end

  def initialize
    @cop = Robocop.new
  end

  def invalid_command (args = nil)
    puts "Unrecognized command."
  end

  def move_forward (args)
    blocks_to_move_s = args[0] || 1
    blocks_to_move   = blocks_to_move_s.to_i

    if args.length > 1
      puts "Error: invalid number of arguments (expecting 0 or 1 arguments)."
      return
    end

    if (blocks_to_move_s =~ /[^0-9]/) or (blocks_to_move == 0)
      puts "Error: invalid argument (expecting a positive integer)."
      return
    end

    blocks_to_move.times do
      if @cop.can_move_forward?
        # puts "The robot is moving forward..."
        @cop.move_forward!
        # sleep 0.5
        puts "#{_status}"
      else
        puts "Unable to move forward: robot is at the CBD boundary (#{@cop.perpendicular_street})."
        return
      end
    end
  end

  def turn_right (args = nil)
    @cop.turn_right!
    puts "The robot has turned right."
    puts "#{_status}"
  end

  def turn_left (args = nil)
    @cop.turn_left!
    puts "The robot has turned left."
    puts "#{_status}"
  end

  def add_robot (args = nil)
    puts "We haven't implemented this yet!"
  end

  def select_robot (args)
    puts "We haven't implemented this yet!"
  end

  def display_map (args = nil)
    puts "We haven't implemented this yet!"
  end

  def beep (args = nil)
    puts "\"#{@cop.beep}\""
  end

  def status (args = nil)
    puts "#{_status}"
  end

  def help (args = nil)
    puts "Usage:"
    puts " f)orward, f)orward n - Move robot forward by one (or n) block/s"
    puts " r)ight               - Swivel robot to the right"
    puts " l)eft                - Swivel robot to the left"
    puts " h)elp                - Display this help text"
    puts " s)tatus              - Display robot status"
    puts " q)uit                - Exit this program"
  end

  def quit (args = nil)
    exit
  end

  private

  def _status
    "The robot is at the intersection of #{@cop.streets[:y]} and #{@cop.streets[:x]}, facing #{@cop.orientation}."
  end

end