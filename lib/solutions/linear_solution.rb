class LinearSolution < Solution

  def preprocess_instructions
    @instructions = instructions.chars.map { |i| i == 'M' ? 1 : i }
  end
end