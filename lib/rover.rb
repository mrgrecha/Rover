class Rover
  include Validations
  extend MethodDecorators
  attr_reader :current_position, :current_orientation

  def initialize(args)
    @current_position, @current_orientation = args[:coordinates_and_direction]
  end

  +StepLogger
  def turn_right
    @current_orientation = orientations[(index_of_current_orientation + 1) % 4]
  end

  +StepLogger
  def turn_left
    @current_orientation = orientations[(index_of_current_orientation - 1) % 4]
  end

  +StepLogger
  def move(step)
    @current_position = [current_position, (step * vectorize_current_orientation).to_a].transpose.map { |x| x.reduce(:+) }
    validate_step(current_position)
  end

  private

  def vectorize_current_orientation
    case current_orientation
    when 'N'
      Vector[0, 1]
    when 'E'
      Vector[1, 0]
    when 'S'
      Vector[0, -1]
    when 'W'
      Vector[-1, 0]
    else
      raise ArgumentError, "Not expected orientation #{current_orientation}"
    end
  end

  def orientations
    %w{N E S W}
  end

  def index_of_current_orientation
    orientations.index(@current_orientation)
  end
end
