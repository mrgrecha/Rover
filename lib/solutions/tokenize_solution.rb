class TokenizeSolution < Solution
  attr_reader :step_counter, :instuctions, :result_instructions, :step_orientation

  def post_initialize
    @step_orientation = 0
    @step_counter = 0
    @result_instructions = []
  end

  def preprocess_instructions
    instructions.chars.each do |instruction|
      if instruction == 'M'
        increment_step_counter
      elsif instruction == 'L' || instruction == 'R'
        increment_step_orientation(instruction)
      else
        raise ArgumentError, "Not expected instruction #{instruction}"
      end
    end
    update_step_orientation
    update_step_counter
    @instructions = result_instructions
  end

  private

  def refresh_step_counter
    @step_counter = 0
  end

  def refresh_step_orientation
    @step_orientation = 0
  end

  def update_step_counter
    return unless step_counter > 0
    @result_instructions << step_counter
    refresh_step_counter
  end

  def update_step_orientation
    return unless @step_orientation != 0
    @result_instructions += simplify_orientation
    refresh_step_orientation
  end

  def increment_step_counter
    update_step_orientation
    @step_counter += 1
  end

  def increment_step_orientation(orientation)
    update_step_counter
    if orientation == 'L'
      @step_orientation -= 1
    elsif orientation == 'R'
      @step_orientation += 1
    end
  end

  def simplify_orientation
    number_of_steps = step_orientation.remainder(4)
    step_orientation > 0 ? ['R'] * (step_orientation % 4) : ['L'] * (number_of_steps.remainder(4) * -1)
  end
end
