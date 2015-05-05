class Model
  # Need a way of handling multiple robots... without having to
  # adjust the existing code too much :)
  # Maybe just an array of robots with a currently 'selected'
  # robot exposed (e.g., model.selected_robot.etc)? Can then
  # use as drop-in replacement for a @cop instance.
  # Would need methods like: add_robot, select_robot, etc.
end