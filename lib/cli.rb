require_relative "robocop"
require_relative "robocop_controller"
require 'readline'

class Cli
  def initialize
    @cop_ctrl = RobocopController.new
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
        parse_command(input)
      end
    end
  end

  def launch_text
    puts "Robocop launching... activated!"
    puts ""

    puts "Enter a command or type enter help for more information"
  end


  # This is our command parser

  def parse_command(command)
    if command == 'f'
      @cop_ctrl.move_robot_forward!
    else
      invalid_command(command)
    end
  end

  def invalid_command(command)
    puts "'#{command}' is not a valid command."
  end

end