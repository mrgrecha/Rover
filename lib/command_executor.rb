class CommandExecutor
  attr_reader :transport

  def initialize(args)
    @transport = args[:transport]
  end

  def execute_instructions(instructions)
    instructions.each do |instruction|
      case
      when instruction == 'L'
        transport.turn_left
      when instruction == 'R'
        transport.turn_right
      when instruction.is_a?(Integer)
        transport.move(instruction)
      else
        raise ArgumentError, "Not expected instruction #{instruction}"
      end
    end
    show_result
  end

  private

  def show_result
    puts "#{transport.current_position.join(' ')} #{transport.current_orientation}"
  end
end
