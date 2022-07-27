require './app/commands/left'
require './app/presentation/utils'

def left_service(id, command, games)
  raise ArgumentError, 'id required' unless id

  game_found = games.find_game(id)
  return {} if game_found.nil?

  result_command = left_command(command, game_found)
  return {} if result_command.nil?

  format_output(result_command)
end
