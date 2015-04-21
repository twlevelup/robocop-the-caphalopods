require_relative "robocop"
require 'readline'

class Cli
  def initialize
    @cop = Robocop.new
    launch_text()
  end

  def start
    while true
      puts ""
      print " > "
      STDOUT.flush

      # Suggestion: we could use readline here (can then use cursor
      # keys to scroll through command history) (returns a nil if
      # user hits ctrl-D, otherwise returns a string as gets does):
      #     input = Readline.readline(​" > "​, true)
      input = gets.chomp

      if input != ''
        output_method = parse_command(input)
        result = (eval output_method)

        if result
          puts current_status
        end
      end
    end
  end

  def launch_text
    puts "Robocop launching... activated!"
    puts ""

    puts "Enter a command or type enter help for more information"
  end

  def current_status
    "The robot is at intersection of #{@cop.street_names} facing #{@cop.orientation}."
  end

  def parse_command(command)
    if command == 'f'
      return 'move_robot_forward'
    elsif command == ''
      return 'false'
    end
      "invalid_command('#{command}')"
  end

  def invalid_command(command)
    puts "'#{command}' is not a valid command."
  end

  def move_robot_forward
    if @cop.can_move_forward?
      @cop.move_forward
      output("Moving cop forward")
      true
    else
      output("Error: Cannot perform command, move forward, movement is invalid")
      false
    end
  end

  def output(string)
    puts ""
    puts string
    puts ""
  end

end