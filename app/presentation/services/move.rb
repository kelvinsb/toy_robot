require './app/commands/move'
require './app/presentation/utils'

def move_service(id, command, games)
  raise ArgumentError, 'id required' unless id

  game_finded = games.find_game(id)
  return {} if game_finded.nil?

  result_command = move_command(command, game_finded)
  return {} if result_command.nil?

  format_output(result_command)
end
