require_relative "robocop_controller"
require 'readline'

class Cli

  @@actions = {

      'help'          => { :func => :help,            :args => nil },
      'h'             => { :func => :help,            :args => nil },

      'forward'       => { :func => :move_forward,    :args => [:integer, 0, 1] },
      'f'             => { :func => :move_forward,    :args => [:integer, 0, 1] },

      'right'         => { :func => :turn_right,      :args => nil },
      'r'             => { :func => :turn_right,      :args => nil },

      'left'          => { :func => :turn_left,       :args => nil },
      'l'             => { :func => :turn_left,       :args => nil },

      'status'        => { :func => :status,          :args => nil },
      's'             => { :func => :status,          :args => nil },

      'quit'          => { :func => :quit,            :args => nil },
      'q'             => { :func => :quit,            :args => nil },

      'goto'          => { :func => :go_to,           :args => [:string, 2, 2] },
      'g'             => { :func => :go_to,           :args => [:string, 2, 2] },

      'map'           => { :func => :display_map,      :args => nil },
      'm'             => { :func => :display_map,      :args => nil },

      # TODO add more commands here:

      # 'add'         =>
      # 'a'           =>

      # 'choose'      =>
      # 'c'           =>
  }

  @@actions.default   =  { :func => :invalid_command, :args => nil }

  def initialize
    @controller = RobocopController.new
  end

  def start

    # PO wants help text & current status
    # to be displayed at startup
    @controller.help; puts
    @controller.status

    loop do

      keyboard_input = Readline.readline("> ", true)

      @command, *@args = keyboard_input.split

      next if @command.nil?

      next if not valid_command_arguments?

      @controller.send(@@actions[@command][:func], @args)

    end

  end

  def valid_command_arguments?

    function_name       = @@actions[@command][:func]
    arg_specs           = @@actions[@command][:args]

    expected_arg_type   = arg_specs[0] if arg_specs

    expected_args_min   = arg_specs[1] if arg_specs
    expected_args_min   = expected_args_min || 0

    expected_args_max   = arg_specs[2] if arg_specs
    expected_args_max   = expected_args_max || 0

    # Skip argument checking for unrecognized commands:
    return true if function_name == :invalid_command

    if expected_arg_type == :string
      @args.each { | arg | arg.capitalize! }
      @args = @args.join(" ").split(", ")
      @args.each { | arg | arg.delete!(",.") }
    end

    if expected_arg_type == :integer
      @args.each do | arg |
        if (arg =~ /[^0-9]/) or (arg.to_i == 0)
          puts "Error: invalid argument/s (expecting positive integer/s)."
          return false
        end
      end
    end

    if @args.length < expected_args_min || @args.length > expected_args_max
      puts "Error: invalid number of arguments."
      return false
    end

    return true
  end

end