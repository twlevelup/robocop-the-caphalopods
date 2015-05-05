require_relative "cli_view_controller"
require 'readline'

class CLIView

  def initialize
    @view_controller = CLIViewController.new
  end

  def start

    @view_controller.send(:help, nil) { | status | puts status }

    loop do

      keyboard_input = Readline.readline("> ", true)

      # Note: readline returns nil when user enters
      # ctrl-D to quit:
      break if keyboard_input.nil?

      command, *args = keyboard_input.split

      # command will be nil if user only entered spaces
      # or just hit return:
      next  if command.nil?

      message = @view_controller.actions[command]

      @view_controller.send(message, args) { | status | puts status }

    end

    puts "Goodbye."
  end

end