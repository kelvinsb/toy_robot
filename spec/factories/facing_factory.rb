FACING_LIST_ENTITY = %w[TOP RIGHT BOTTOM LEFT]
FACING_LIST_COMMAND = %w[NORTH EAST SOUTH WEST]

def generate_facing_entity
  FACING_LIST_ENTITY[rand(1..3)]
end

def generate_facing_command
  FACING_LIST_COMMAND[rand(1..3)]
end
