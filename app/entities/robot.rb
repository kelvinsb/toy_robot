FACING = {
  'TOP': 0,
  'RIGHT': 1,
  'BOTTOM': 2,
  'LEFT': 3
}

class Robot
  attr_reader :position_x, :position_y, :facing

  def initialize(position_x, position_y, facing)
    position_x_validations(position_x)
    position_y_validations(position_y)
    facing_validations(facing)

    temp_facing = if facing.is_a? Symbol
                    FACING[facing]
                  else
                    FACING[facing.to_sym]
                  end
    raise ArgumentError, 'must be specified a valid facing' if temp_facing.nil?

    @position_x = position_x
    @position_y = position_y
    @facing = temp_facing
  end

  private

  def position_x_validations(position_x)
    raise ArgumentError, 'position_x must be integer' unless position_x.is_a? Integer
    raise ArgumentError, 'position_x must be positive' unless position_x >= 0
  end

  def position_y_validations(position_y)
    raise ArgumentError, 'position_y must be integer' unless position_y.is_a? Integer
    raise ArgumentError, 'position_y must be positive' unless position_y >= 0
  end

  def facing_validations(facing)
    unless (facing.is_a? String) || (facing.is_a? Symbol) || (facing.is_a? Hash)
      raise ArgumentError,
            'facing must be string'
    end
    raise ArgumentError, 'facing must length must be more than 0' if facing.empty?
  end
end
