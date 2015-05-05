# require_relative "model"
require_relative "robocop"

class CLIViewController

  @@actions = {

      'help'          => :help,
      'h'             => :help,

      'forward'       => :move_forward,
      'f'             => :move_forward,

      'right'         => :turn_right,
      'r'             => :turn_right,

      # 'left'          => :turn_left,
      # 'l'             => :turn_left,

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

  def invalid_command(args)
    yield "Unrecognized command."
  end

  def move_forward(args)
    blocks_to_move_s = args[0] || 1
    blocks_to_move   = blocks_to_move_s.to_i

    if args.length > 1
      yield "Error: invalid number of arguments (expecting 0 or 1 arguments)."
      return
    end

    if (blocks_to_move_s =~ /[^0-9]/) or (blocks_to_move == 0)
      yield "Error: invalid argument (expecting a positive integer)."
      return
    end

    blocks_to_move.times do
      if @cop.can_move_forward?
        # yield "The robot is moving forward..."
        @cop.move_forward!
        # sleep 0.5
        yield "#{_status}"
      else
        yield "Unable to move forward: robot is at the CBD boundary (#{@cop.perpendicular_street})."
        return
      end
    end
  end

  def turn_right(args)
    @cop.turn_right!
    yield "The robot has turned right."
    yield "#{_status}"
  end

  def turn_left(args)
    @cop.turn_left!
    yield "The robot is now facing #{@cop.orientation}."
  end

  def add_robot(args)
    yield "We haven't implemented this yet!"
  end

  def select_robot(args)
    yield "We haven't implemented this yet!"
  end

  def display_map(args)
    yield "We haven't implemented this yet!"
  end

  def beep(args)
    yield "\"#{@cop.beep}\""
  end

  def status(args)
    yield "#{_status}"
  end

  def help(args)
    yield "Usage:"
    yield " f)orward, f)orward n - Move robot forward by one (or n) block/s"
    yield " r)ight               - Swivel robot to the right"
    # yield " l)eft                - Swivel robot to the left"
    yield " h)elp                - Display this help text"
    yield " s)tatus              - Display robot status"
    yield " q)uit                - Exit this program"
  end

  def quit(args)
    exit
  end

  private

  def _status
    "The robot is at the intersection of #{@cop.streets[:y]} and #{@cop.streets[:x]}, facing #{@cop.orientation}."
  end

end