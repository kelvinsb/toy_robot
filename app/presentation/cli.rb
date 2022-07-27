require './app/entities/game'
require './app/commands/place'
require './app/commands/move'
require './app/commands/left'
require './app/commands/right'
require './app/commands/report'
require_relative 'utils'

THE_GAME = Game.new(5)

def execute_commands(command, arguments)
  return false unless command

  case command
  when 'PLACE'
    place_command(command, arguments, THE_GAME)
  when 'MOVE'
    move_command(command, THE_GAME)
  when 'LEFT'
    left_command(command, THE_GAME)
  when 'RIGHT'
    right_command(command, THE_GAME)
  else
    puts report_command(command, THE_GAME)
  end
end

while true
  input = gets
  command, arguments = input.split(' ')

  execute_commands(command, arguments)

  break if command == 'exit'
end
