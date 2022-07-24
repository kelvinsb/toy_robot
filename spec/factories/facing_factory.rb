FACING_LIST = %w[TOP RIGHT BOTTOM LEFT]

def generate_facing
  FACING_LIST[rand(1..3)]
end
