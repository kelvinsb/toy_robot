FACING_ENTITY_TO_COMMAND = {
  'TOP': 'NORTH',
  'RIGHT': 'EAST',
  'BOTTOM': 'SOUTH',
  'LEFT': 'WEST'
}

FACING_COMMAND_TO_ENTITY = FACING_ENTITY_TO_COMMAND.invert

def facing_adaptor_entity_to_command(key)
  FACING_ENTITY_TO_COMMAND[key].to_s
end

def facing_adaptor_command_to_entity(key)
  FACING_COMMAND_TO_ENTITY[key].to_s
end
