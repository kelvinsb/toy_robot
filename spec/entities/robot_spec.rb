require './app/entities/robot'
require './spec/factories/facing_factory'
require './spec/factories/position_factory'

RSpec.describe 'Robot entity' do
  context '(WRONG) position_x' do
    it 'position_x not number' do
      position_x = 'something here'
      position_y = positive_position_factory
      facing = generate_facing

      expect { Robot.new(position_x, position_y, facing) }.to raise_error(ArgumentError, 'position_x must be integer')
    end

    it 'position_x less than 0' do
      position_x = -1
      position_y = positive_position_factory
      facing = generate_facing

      expect { Robot.new(position_x, position_y, facing) }.to raise_error(ArgumentError, 'position_x must be positive')
    end
  end

  context '(WRONG) position_y' do
    it 'position_y not number' do
      position_x = positive_position_factory
      position_y = 'something here'
      facing = generate_facing

      expect { Robot.new(position_x, position_y, facing) }.to raise_error(ArgumentError, 'position_y must be integer')
    end

    it 'position_y less than 0' do
      # Arrange
      position_x = positive_position_factory
      position_y = -1
      facing = generate_facing

      expect { Robot.new(position_x, position_y, facing) }.to raise_error(ArgumentError, 'position_y must be positive')
    end
  end

  context '(WRONG) facing' do
    it 'facing not a string' do
      position_x = positive_position_factory
      position_y = positive_position_factory
      facing = 2

      expect { Robot.new(position_x, position_y, facing) }.to raise_error(ArgumentError, 'facing must be string')
    end

    it 'facing empty string' do
      # Arrange
      position_x = positive_position_factory
      position_y = positive_position_factory
      facing = ''

      expect do
        Robot.new(position_x, position_y, facing)
      end.to raise_error(ArgumentError, 'facing must length must be more than 0')
    end

    it 'facing empty string' do
      # Arrange
      position_x = positive_position_factory
      position_y = positive_position_factory
      facing = 'NORTHWEST'

      expect do
        Robot.new(position_x, position_y, facing)
      end.to raise_error(ArgumentError, 'must be specified a valid facing')
    end
  end

  context 'right' do
    it 'all' do
      # Arrange
      position_x = positive_position_factory
      position_y = positive_position_factory
      facing = generate_facing
      facing_expected = FACING[facing.to_sym]

      # Act
      the_robot = Robot.new(position_x, position_y, facing)

      # Assert
      expect(the_robot.position_x).to eq(position_x)
      expect(the_robot.position_y).to eq(position_y)
      expect(the_robot.facing).to eq(facing_expected)
    end
  end
end
