require './app/commands/place'
require './app/presentation/utils'

def place_service(command, arguments, games)
  raise ArgumentError, 'arguments required' unless arguments

  game_created = games.create_game
  result_command = place_command(command, arguments, game_created)
  format_output(result_command)
end
