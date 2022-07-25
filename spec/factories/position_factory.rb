def positive_position_factory
  rand(0..100)
end

def position_between_factory(max_grid)
  rand(0..max_grid)
end

def dimension_factory
  rand(1..100)
end

def dimension_and_positions_factory
  dimension = dimension_factory
  position_x = rand(1..dimension)
  position_y = rand(1..dimension)
  [dimension, position_x, position_y]
end
