require_relative "robocop_controller"
require 'readline'

class Cli

  def initialize
    @controller = RobocopController.new
  end

  def start

    # At startup, display help text &
    # current status:
    @controller.help; puts
    @controller.status

    loop do

      keyboard_input = Readline.readline("> ", true)

      command, *args = keyboard_input.split

      # command will be nil if user didn't enter any
      # text (e.g., just hit the return key):
      next if command.nil?

      message = @controller.actions[command]

      @controller.send(message, args)

    end

    puts "Goodbye."
  end

end